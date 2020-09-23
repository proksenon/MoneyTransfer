//
//  TransactionViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class TransactionViewController: UIViewController {

	typealias TransactionDelegate = TogleTransactionDelegate & TransactionViewDelegate
	var output: TransactionViewOutput?
	var moduleInput: TransactionModuleInput?
	var moduleOutput: TransactionDelegate?
	private var transactionView: TransactionView?

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func loadView() {
		let view = TransactionView()
		self.view = view
		transactionView = view
	}

}
// MARK: -TransactionViewInput
extension TransactionViewController: TransactionViewInput {


	func setView() {
		view.roundedCorner(with: 20)
		view.backgroundColor = .white
	}

	//MARK: -KeyboardNotification
	func setupNotificationKeyboard() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@IBAction private func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			moduleOutput?.moveTransactionView(on: ViewSize(size: keyboardSize.height))
		}
	}

	@IBAction private func keyboardWillHide(notification: NSNotification) {
		moduleOutput?.moveTransactionView(on: ViewSize(size: 0))
	}

	//MARK: -OperationLabel
	func setTitleForOperationLabel(title: String) {
		guard let transactionView = transactionView, let nameOperationLabel = transactionView.nameOperationLabel else { return }

		nameOperationLabel.text = title
	}

	//MARK: -MoneyTextfield
	func textFieldText()-> String? {
		return transactionView?.moneyTextfield?.text
	}

	func setupMoneyTextField() {
		guard let transactionView = transactionView, let moneyTextfield = transactionView.moneyTextfield else { return }

		moneyTextfield.delegate = self
	}

	func changeCornerColorMoneyTextField(result: Status) {
		guard let transactionView = transactionView, let moneyTextfield = transactionView.moneyTextfield else { return }
		var color: CGColor
		switch result {
		case .failure:
			color = .init(srgbRed: 1, green: 0.1, blue: 0, alpha: 0.5)
		case .success:
			color = .init(srgbRed: 0, green: 1, blue: 0.1, alpha: 0.5)
		}
		moneyTextfield.layer.borderWidth = 1
		moneyTextfield.layer.borderColor = color
	}
	//MARK: -OperationButton
	func setTargetOnOperationButton() {
		guard let transactionView = transactionView, let operationButton = transactionView.operationButton else { return }

		operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
	}

	func setTitleForOperationButton(title: String) {
		guard let transactionView = transactionView, let operationButton = transactionView.operationButton else { return }
		operationButton.setTitle(title, for: .normal)
	}

	func operationButtonIsEnabled(isEnabled: Bool) {
		guard let transactionView = transactionView, let operationButton = transactionView.operationButton else { return }
		if isEnabled {
			operationButton.backgroundColor = .green
		} else {
			operationButton.backgroundColor = .systemGray2
		}
		operationButton.isUserInteractionEnabled = isEnabled
	}

	@IBAction private func operationButtonDidTapped() {
		output?.setNewBalance()
		moduleOutput?.transactionMoney(amount: output?.formatingTextField())
		moduleOutput?.balance(balance: output?.getBalance())
		moduleOutput?.toggleTransaction(on: .treatmentViewController)
	}

}
// MARK: -UITextFieldDelegate
extension TransactionViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		guard let output = output else { return false}
		return output.checkTextFieldString(text: textField.text, string: string)
	}

	func textFieldDidChangeSelection(_ textField: UITextField) {
		guard let output = output else { return }
		textField.text = output.checkExcessSymbols(text: textField.text)
		output.checkBalance()
	}

}

