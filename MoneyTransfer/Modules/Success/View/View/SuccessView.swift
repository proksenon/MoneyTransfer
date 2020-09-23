//
//  SuccessView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class SuccessView: UIView {

	var treatmentImageView: UIImageView?
	var statusLabel: UILabel?
	var atributeTransactionLabel: UILabel?
	var amountOfMoneyLabel: UILabel?
	var operationButton: UIButton?
	var changeBalanceLabel: UILabel?
	var beforeTransactionBalanceLabel: UILabel?
	var currentBalanceLabel: UILabel?

	init() {
		let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 450)
		super.init(frame: frame)
		setupTreatmentImageView()
		setupStatusLabel()
		setupAtributeTransactionLabel()
		setupAmountOfMoneyLabel()
		setupExitButton()
		setupChangeBalanceLabel()
		setupBeforeTransactionBalanceLabel()
		setupCurrentBalanceLabel()
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: -TreatmentImageView
	func setupTreatmentImageView() {
		let treatmentImageView = UIImageView()
		addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 60),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: 60)])


		treatmentImageView.image = UIImage(systemName: "checkmark.circle")?.withTintColor(.green, renderingMode: .alwaysOriginal)
		self.treatmentImageView = treatmentImageView
	}

	//MARK: -StatusLabel
	func setupStatusLabel() {
		guard let treatmentImageView = treatmentImageView else { return }
		let statusLabel = UILabel()
		addSubview(statusLabel)
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: 20),
									 statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: 300)])

		statusLabel.mainLabel(title: "Перевод прошел успешно")
		self.statusLabel = statusLabel
	}

	//MARK: -AtributeTransactionLabel
	func setupAtributeTransactionLabel() {
		guard let statusLabel = statusLabel else { return }
		let atributeTransactionLabel = UILabel()
		addSubview(atributeTransactionLabel)
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: 300)])

		atributeTransactionLabel.subLabel(title: "Переведено")
		self.atributeTransactionLabel = atributeTransactionLabel
	}

	//MARK: -AmountOfMoneyLabel
	func setupAmountOfMoneyLabel() {
		guard let atributeTransactionLabel = atributeTransactionLabel else { return }
		let amountOfMoneyLabel = UILabel()
		addSubview(amountOfMoneyLabel)
		NSLayoutConstraint.activate([amountOfMoneyLabel.topAnchor.constraint(equalTo: atributeTransactionLabel.bottomAnchor, constant: 10),
									 amountOfMoneyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 amountOfMoneyLabel.widthAnchor.constraint(equalToConstant: 300)])

		amountOfMoneyLabel.mainLabel(title: "money")
		self.amountOfMoneyLabel = amountOfMoneyLabel
	}

	//MARK: -OperationButton
	func setupExitButton() {
		let operationButton = UIButton()
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)])

		operationButton.styleButton(title: "Перейти в контакты")
		self.operationButton = operationButton
	}

	//MARK: -ChangeBalanceLabel
	func setupChangeBalanceLabel() {
		let changeBalanceLabel = UILabel()
		addSubview(changeBalanceLabel)
		guard let amountOfMoneyLabel = amountOfMoneyLabel else { return }
		NSLayoutConstraint.activate([changeBalanceLabel.topAnchor.constraint(equalTo: amountOfMoneyLabel.bottomAnchor, constant: 20),
									 changeBalanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 changeBalanceLabel.widthAnchor.constraint(equalToConstant: 300)])

		changeBalanceLabel.subLabel(title: "Изменение баланса")
		self.changeBalanceLabel = changeBalanceLabel
	}

	//MARK: -BeforeTransactionBalanceLabel
	func setupBeforeTransactionBalanceLabel() {
		let beforeTransactionBalanceLabel = UILabel()
		addSubview(beforeTransactionBalanceLabel)
		guard let changeBalanceLabel = changeBalanceLabel else { return }
		NSLayoutConstraint.activate([beforeTransactionBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: 10),
									 beforeTransactionBalanceLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: -5),
									 beforeTransactionBalanceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])

		beforeTransactionBalanceLabel.subLabel(title: "999999")
		beforeTransactionBalanceLabel.strikeThrough(true)
		beforeTransactionBalanceLabel.textAlignment = .right
		self.beforeTransactionBalanceLabel = beforeTransactionBalanceLabel
	}

	//MARK: -CurrentBalanceLabel
	func setupCurrentBalanceLabel() {
		let currentBalanceLabel = UILabel()
		addSubview(currentBalanceLabel)
		guard let changeBalanceLabel = changeBalanceLabel else { return }
		NSLayoutConstraint.activate([currentBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: 10),
									 currentBalanceLabel.leftAnchor.constraint(equalTo: centerXAnchor, constant: 5),
									 currentBalanceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)])

		currentBalanceLabel.subLabel(title: "999999")
		currentBalanceLabel.textAlignment = .left
		currentBalanceLabel.textColor = .black
		self.currentBalanceLabel = currentBalanceLabel
	}
	
}
