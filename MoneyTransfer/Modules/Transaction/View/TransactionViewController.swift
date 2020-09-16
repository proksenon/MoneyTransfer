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
	private var nameOperationLabel: UILabel?
	private var operationButton: UIButton?
	private var moneyTextfield: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

}
// MARK: -TransactionViewInput
extension TransactionViewController: TransactionViewInput {

	func setView() {
		view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 320)
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
	func setupNameOperationLabel() {
		let nameOperationLabel = UILabel()
		view.addSubview(nameOperationLabel)
		NSLayoutConstraint.activate([nameOperationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
									 nameOperationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)])

		nameOperationLabel.mainLabel(title: "Перевод средств")
		self.nameOperationLabel = nameOperationLabel
	}

	func setTitleForOperationLabel(title: String) {
		guard let nameOperationLabel = nameOperationLabel else { return }
		nameOperationLabel.text = title
	}

	//MARK: -MoneyTextfield
	func setupMoneyTextfield() {
		guard let nameOperationLabel = nameOperationLabel else { return }
		let moneyTextfield = UITextField()
		moneyTextfield.delegate = self
		moneyTextfield.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.6)
		moneyTextfield.placeholder = "Укажите сумму"
		moneyTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: moneyTextfield.frame.height))
		moneyTextfield.leftViewMode = .always
		moneyTextfield.keyboardType = .numberPad
		moneyTextfield.clearsOnBeginEditing = true
		view.addSubview(moneyTextfield)

		moneyTextfield.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([moneyTextfield.topAnchor.constraint(equalTo: nameOperationLabel.bottomAnchor, constant: 40),
									 moneyTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
									 moneyTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
									 moneyTextfield.heightAnchor.constraint(equalToConstant: 40)])

		moneyTextfield.roundedCorner(with: 4)
		self.moneyTextfield = moneyTextfield
	}

	func textFieldText()-> String? {
		return moneyTextfield?.text
	}

	func changeCornerColorMoneyTextField(result: Status) {
		guard let moneyTextfield = moneyTextfield else { return }
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
	func setupOperationButton() {
		let operationButton = UIButton()
		view.addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)])
		
		operationButton.styleButton(title: "Перевести", color: .systemGray2)
		operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
		self.operationButton = operationButton
	}

	func setTitleForOperationButton(title: String) {
		guard let operationButton = operationButton else { return }
		operationButton.setTitle(title, for: .normal)
	}

	func operationButtonIsEnabled(isEnabled: Bool) {
		guard let operationButton = operationButton else { return }
		if isEnabled {
			operationButton.backgroundColor = .green
		} else {
			operationButton.backgroundColor = .systemGray2
		}
		operationButton.isUserInteractionEnabled = isEnabled
	}

	@IBAction private func operationButtonDidTapped() {
		output?.setNewBalance(transaction: moneyTextfield?.text)
		moduleOutput?.transactionMoney(amount: moneyTextfield?.text)
		moduleOutput?.balance(balance: output?.getBalance())
		moduleOutput?.toggleTransaction(on: .treatmentViewController)
	}

}
// MARK: -UITextFieldDelegate
extension TransactionViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

		var acceptChars = Array(0...9).map { (int) -> String in
			String(int)
		}

		acceptChars.append(".")
		for char in string {
			if !acceptChars.contains(String(char)) {
				return false
			}
		}
		return true
	}

	func textFieldDidChangeSelection(_ textField: UITextField) {
		if var str = textField.text {
			if str.count > 0 {
				if str.first == "0" {
					str.remove(at: str.firstIndex(of: "0")!)
				}
				textField.text = str
			}
		}
		output?.checkBalance(transaction: textField.text)
	}
}
