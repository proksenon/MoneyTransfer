//
//  TransactionViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

	var output: TransactionViewOutput?
	var moduleInput: TransactionModuleInput?
	var moduleOutput: TransactionViewDelegate?
	var nameOperationLabel: UILabel?
	var exitButton: UIButton?
	var operationButton: UIButton?
	var moneyTextfield: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

}
// MARK: -TransactionViewInput
extension TransactionViewController: TransactionViewInput {

	func setView() {
		view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 350)
		view.roundedCorner(with: 20)
		view.backgroundColor = .white
	}

	//MARK: -KeyboardNotification
	func setupNotificationKeyboard() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@IBAction func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			moduleOutput?.moveTransactionView(on: keyboardSize.height)
		}
	}

	@IBAction func keyboardWillHide(notification: NSNotification) {
		moduleOutput?.moveTransactionView(on: 0)
	}

	//MARK: -OperationLabel
	func setupNameOperationLabel() {
		let nameOperationLabel = UILabel()
		nameOperationLabel.text = "Перевод средств"
		nameOperationLabel.textColor = .black

		view.addSubview(nameOperationLabel)
		nameOperationLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([nameOperationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
									 nameOperationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)])
		self.nameOperationLabel = nameOperationLabel
	}
	//MARK: -ExitButton
	func setupExitButton() {
		let exitButton = UIButton()
		exitButton.translatesAutoresizingMaskIntoConstraints = false
		exitButton.titleLabel?.text = "exit"
		exitButton.backgroundColor = .lightGray
		view.addSubview(exitButton)
		NSLayoutConstraint.activate([exitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
									 exitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
									 exitButton.widthAnchor.constraint(equalToConstant: 30),
									 exitButton.heightAnchor.constraint(equalToConstant: 30)])
		exitButton.addTarget(self, action: #selector(exitButtonDidTapped), for: .touchUpInside)
		self.exitButton = exitButton
	}

	@IBAction func exitButtonDidTapped() {
		moduleOutput?.toggleTransaction()
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
		view.addSubview(moneyTextfield)
		moneyTextfield.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([moneyTextfield.topAnchor.constraint(equalTo: nameOperationLabel.bottomAnchor, constant: 40),
									 moneyTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
									 moneyTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
									 moneyTextfield.heightAnchor.constraint(equalToConstant: 40)])
		moneyTextfield.roundedCorner(with: 4)
		self.moneyTextfield = moneyTextfield
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
//		guard let moneyTextfield = moneyTextfield else { return }
		let operationButton = UIButton()
		view.addSubview(operationButton)
		operationButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
//									 operationButton.topAnchor.constraint(equalTo: moneyTextfield.bottomAnchor, constant: 40),
									 operationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
									 operationButton.heightAnchor.constraint(equalToConstant: 40)])
		operationButton.backgroundColor = .systemGray2
		operationButton.setTitle("Перевести", for: .normal)
		operationButton.titleLabel?.textColor = .white
		operationButton.isUserInteractionEnabled = false
		operationButton.roundedCorner(with: 15)
		operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
		self.operationButton = operationButton
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

	@IBAction func operationButtonDidTapped() {
		print("operationButtonDidTapped")
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

extension UIView {
	func roundedCorner(with radius: CGFloat) {
		self.layer.cornerRadius = radius
		self.clipsToBounds = true
	}
}
