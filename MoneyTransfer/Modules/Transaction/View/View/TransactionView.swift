//
//  TransactionView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class TransactionView: UIView {

	var nameOperationLabel: UILabel?
	var operationButton: UIButton?
	var moneyTextfield: UITextField?

	init() {
		let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 320)
		super.init(frame: frame)
		setupNameOperationLabel()
		setupMoneyTextfield()
		setupOperationButton()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: -OperationLabel
	private func setupNameOperationLabel() {
		let nameOperationLabel = UILabel()
		addSubview(nameOperationLabel)
		NSLayoutConstraint.activate([nameOperationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
									 nameOperationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15)])

		nameOperationLabel.mainLabel(title: "Перевод средств")
		self.nameOperationLabel = nameOperationLabel
	}

	//MARK: -MoneyTextfield
	private func setupMoneyTextfield() {
		guard let nameOperationLabel = nameOperationLabel else { return }
		let moneyTextfield = UITextField()
		moneyTextfield.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.6)
		moneyTextfield.placeholder = "Укажите сумму"
		moneyTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: moneyTextfield.frame.height))
		moneyTextfield.leftViewMode = .always
		moneyTextfield.keyboardType = .decimalPad
		moneyTextfield.clearsOnBeginEditing = true
		addSubview(moneyTextfield)

		moneyTextfield.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([moneyTextfield.topAnchor.constraint(equalTo: nameOperationLabel.bottomAnchor, constant: 40),
									 moneyTextfield.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
									 moneyTextfield.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 moneyTextfield.heightAnchor.constraint(equalToConstant: 40)])

		moneyTextfield.roundedCorner(with: 4)
		self.moneyTextfield = moneyTextfield
	}

	//MARK: -OperationButton
	private func setupOperationButton() {
		let operationButton = UIButton()
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)])

		operationButton.styleButton(title: "Перевести", color: .systemGray2)
		self.operationButton = operationButton
	}

}
