//
//  TreatmentView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class TreatmentView: UIView {

	var treatmentImageView: UIImageView?
	var statusLabel: UILabel?
	var atributeTransactionLabel: UILabel?
	var amountOfMoneyLabel: UILabel?
	var operationButton: UIButton?

	init() {
		let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400)
		super.init(frame: frame)
		setupTreatmentImageView()
		setupStatusLabel()
		setupAtributeTransactionLabel()
		setupAmountOfMoneyLabel()
		setupOperationButton()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupTreatmentImageView() {
		let treatmentImageView = UIImageView()
		addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 60),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: 60)])


		treatmentImageView.image = UIImage(systemName: "clock")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
		self.treatmentImageView = treatmentImageView
	}

	//MARK: -StatusLabel
	private func setupStatusLabel() {
		guard let treatmentImageView = treatmentImageView else { return }
		let statusLabel = UILabel()
		addSubview(statusLabel)
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: 20),
									 statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: 300)])

		statusLabel.mainLabel(title: "Перевод в обработке...")
		self.statusLabel = statusLabel
	}

	//MARK: -AtributeTransactionLabel
	private func setupAtributeTransactionLabel() {
		guard let statusLabel = statusLabel else { return }
		let atributeTransactionLabel = UILabel()
		addSubview(atributeTransactionLabel)
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: 300)])

		atributeTransactionLabel.subLabel(title: "Сумма перевода")
		self.atributeTransactionLabel = atributeTransactionLabel
	}

	//MARK: -AmountOfMoneyLabel
	private func setupAmountOfMoneyLabel() {
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
	private func setupOperationButton() {
		let operationButton = UIButton()
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)])

		operationButton.styleButton(title: "Перейти в контакты")
		self.operationButton = operationButton
	}

}
