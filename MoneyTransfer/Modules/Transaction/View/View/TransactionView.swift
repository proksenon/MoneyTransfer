//
//  TransactionView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class TransactionView: UIView {

	let nameOperationLabel: UILabel = UILabel()
	let operationButton: UIButton = UIButton()
	let moneyTextfield: UITextField = UITextField()

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
		addSubview(nameOperationLabel)
		NSLayoutConstraint.activate([nameOperationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
									 nameOperationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15)])

		nameOperationLabel.mainLabel(title: "Перевод средств")
	}

	//MARK: -MoneyTextfield
	private func setupMoneyTextfield() {
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
	}

	//MARK: -OperationButton
	private func setupOperationButton() {
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)])

		operationButton.styleButton(title: "Перевести", color: .systemGray2)
	}

}
