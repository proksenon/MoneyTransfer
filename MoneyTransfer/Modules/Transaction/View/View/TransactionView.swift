//
//  TransactionView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// View модуля Transaction
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
	/// Настройка лейбла  названия операции
	private func setupNameOperationLabel() {
		addSubview(nameOperationLabel)

		nameOperationLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([nameOperationLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constatns.labelTop),
									 nameOperationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constatns.spacing),
									 nameOperationLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.mainLabelHeight)])

		nameOperationLabel.decorate(with: MainLabelDecorator(title: Labels.transactionMoney))
	}

	//MARK: -MoneyTextfield
	/// Настройка текстфилда для ввода ссуммы транзакции
	private func setupMoneyTextfield() {
		moneyTextfield.backgroundColor = UIColor.systemGray6.withAlphaComponent(Alpha.mediumView)
		moneyTextfield.placeholder = Labels.enterAmount
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

		moneyTextfield.decorate(with: CornerRadiusDecorator(cornerRadius: 4))
	}

	//MARK: -OperationButton
	/// Настройка кнопки операции
	private func setupOperationButton() {
		addSubview(operationButton)

		operationButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ChildsButton.bottomAchor),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: ChildsButton.leftAchor),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: ChildsButton.rightAchor),
									 operationButton.heightAnchor.constraint(equalToConstant: ChildsButton.transactionHeight)])

		operationButton.decorate(with: [TransactionButtonDecorator(title: Labels.transfer, color: .systemGray2), CornerRadiusDecorator(cornerRadius: 15)])
	}

}
