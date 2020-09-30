//
//  TransactionViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// ViewController модуля Transaction
final class TransactionViewController: UIViewController {

	typealias TransactionDelegate = TogleTransactionDelegate & TransactionViewDelegate
	var output: TransactionViewOutput?
	var moduleInput: TransactionModuleInput?
	var moduleOutput: TransactionDelegate?
	let transactionView: TransactionView = TransactionView()

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func loadView() {
		self.view = transactionView
	}

}
// MARK: -TransactionViewInput
extension TransactionViewController: TransactionViewInput {


	func setView() {
		view.decorate(with: CornerRadiusDecorator(cornerRadius: 20))
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
		transactionView.nameOperationLabel.text = title
	}

	//MARK: -MoneyTextfield
	func textFieldText()-> String? {
		return transactionView.moneyTextfield.text
	}

	func setupMoneyTextField() {
		transactionView.moneyTextfield.delegate = self
	}

	func changeCornerColorMoneyTextField(result: Status) {
		var color: CGColor
		switch result {
		case .failure:
			color = .init(srgbRed: 1, green: 0.1, blue: 0, alpha: 0.5)
		case .success:
			color = .init(srgbRed: 0, green: 1, blue: 0.1, alpha: 0.5)
		}
		transactionView.moneyTextfield.layer.borderWidth = 1
		transactionView.moneyTextfield.layer.borderColor = color
	}
	//MARK: -OperationButton
	func setTargetOnOperationButton() {
		transactionView.operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
	}

	func setTitleForOperationButton(title: String) {
		transactionView.operationButton.setTitle(title, for: .normal)
	}

	func operationButtonIsEnabled(isEnabled: Bool) {
		if isEnabled {
			transactionView.operationButton.backgroundColor = .green
		} else {
			transactionView.operationButton.backgroundColor = .systemGray2
		}
		transactionView.operationButton.isUserInteractionEnabled = isEnabled
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
		output.checkBalance()
	}

}

