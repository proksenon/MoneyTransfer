//
//  SuccessView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class SuccessView: UIView {

	let treatmentImageView: UIImageView = UIImageView()
	let statusLabel: UILabel = UILabel()
	let atributeTransactionLabel: UILabel = UILabel()
	let amountOfMoneyLabel: UILabel = UILabel()
	let operationButton: UIButton = UIButton()
	let changeBalanceLabel: UILabel = UILabel()
	let beforeTransactionBalanceLabel: UILabel = UILabel()
	let currentBalanceLabel: UILabel = UILabel()

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
	private func setupTreatmentImageView() {
		addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 60),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: 60)])


		treatmentImageView.image = UIImage(systemName: "checkmark.circle")?.withTintColor(.green, renderingMode: .alwaysOriginal)
	}

	//MARK: -StatusLabel
	private func setupStatusLabel() {
		addSubview(statusLabel)
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: 20),
									 statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: 300)])

		statusLabel.mainLabel(title: "Перевод прошел успешно")
	}

	//MARK: -AtributeTransactionLabel
	private func setupAtributeTransactionLabel() {
		addSubview(atributeTransactionLabel)
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: 300)])

		atributeTransactionLabel.subLabel(title: "Переведено")
	}

	//MARK: -AmountOfMoneyLabel
	private func setupAmountOfMoneyLabel() {
		addSubview(amountOfMoneyLabel)
		NSLayoutConstraint.activate([amountOfMoneyLabel.topAnchor.constraint(equalTo: atributeTransactionLabel.bottomAnchor, constant: 10),
									 amountOfMoneyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 amountOfMoneyLabel.widthAnchor.constraint(equalToConstant: 300)])

		amountOfMoneyLabel.mainLabel(title: "money")
	}

	//MARK: -OperationButton
	private func setupExitButton() {
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)])

		operationButton.styleButton(title: "Перейти в контакты")
	}

	//MARK: -ChangeBalanceLabel
	private func setupChangeBalanceLabel() {
		addSubview(changeBalanceLabel)
		NSLayoutConstraint.activate([changeBalanceLabel.topAnchor.constraint(equalTo: amountOfMoneyLabel.bottomAnchor, constant: 20),
									 changeBalanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 changeBalanceLabel.widthAnchor.constraint(equalToConstant: 300)])

		changeBalanceLabel.subLabel(title: "Изменение баланса")
	}

	//MARK: -BeforeTransactionBalanceLabel
	private func setupBeforeTransactionBalanceLabel() {
		addSubview(beforeTransactionBalanceLabel)
		NSLayoutConstraint.activate([beforeTransactionBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: 10),
									 beforeTransactionBalanceLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: -5),
									 beforeTransactionBalanceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])

		beforeTransactionBalanceLabel.subLabel(title: "999999")
		beforeTransactionBalanceLabel.strikeThrough(true)
		beforeTransactionBalanceLabel.textAlignment = .right
	}

	//MARK: -CurrentBalanceLabel
	private func setupCurrentBalanceLabel() {
		addSubview(currentBalanceLabel)
		NSLayoutConstraint.activate([currentBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: 10),
									 currentBalanceLabel.leftAnchor.constraint(equalTo: centerXAnchor, constant: 5),
									 currentBalanceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)])

		currentBalanceLabel.subLabel(title: "999999")
		currentBalanceLabel.textAlignment = .left
		currentBalanceLabel.textColor = .black
	}
	
}
