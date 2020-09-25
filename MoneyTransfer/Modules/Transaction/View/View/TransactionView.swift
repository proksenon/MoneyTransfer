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
		let frame = CGRect(x: 0, y: 0, width: ViewConstatns.width, height: ChildsAtributes.Hight.transaction)
		super.init(frame: frame)
		setupNameOperationLabel()
		setupMoneyTextfield()
		setupOperationButton()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/// Константы
	private enum Constatns {
		/// Боковой отступ
		static let spacing: CGFloat = 15
		/// Отступ сверху для текстфилда
		static let textFieldTop: CGFloat = 40
		/// Отступ сверху для Label
		static let labelTop: CGFloat = 30
	}

	//MARK: -OperationLabel
	private func setupNameOperationLabel() {
		addSubview(nameOperationLabel)
		NSLayoutConstraint.activate([nameOperationLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constatns.labelTop),
									 nameOperationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constatns.spacing)])

		nameOperationLabel.mainLabel(title: "TransactionMoney".localized)
	}

	//MARK: -MoneyTextfield
	private func setupMoneyTextfield() {
		moneyTextfield.backgroundColor = UIColor.systemGray6.withAlphaComponent(Alpha.mediumView)
		moneyTextfield.placeholder = "EnterAmount".localized
		moneyTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: moneyTextfield.frame.height))
		moneyTextfield.leftViewMode = .always
		moneyTextfield.keyboardType = .decimalPad
		moneyTextfield.clearsOnBeginEditing = true
		addSubview(moneyTextfield)

		moneyTextfield.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([moneyTextfield.topAnchor.constraint(equalTo: nameOperationLabel.bottomAnchor, constant: Constatns.textFieldTop),
									 moneyTextfield.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constatns.spacing),
									 moneyTextfield.leftAnchor.constraint(equalTo: leftAnchor, constant: Constatns.spacing),
									 moneyTextfield.heightAnchor.constraint(equalToConstant: Constatns.textFieldTop)])

		moneyTextfield.roundedCorner(with: 4)
	}

	//MARK: -OperationButton
	private func setupOperationButton() {
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ChildsButton.bottomAchor),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: ChildsButton.leftAchor),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: ChildsButton.rightAchor)])

		operationButton.styleButton(title: "Transfer".localized, color: .systemGray2)
	}

}
