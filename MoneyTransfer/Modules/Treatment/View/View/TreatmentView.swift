//
//  TreatmentView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class TreatmentView: UIView {

	let treatmentImageView: UIImageView = UIImageView()
	let statusLabel: UILabel = UILabel()
	let atributeTransactionLabel: UILabel = UILabel()
	let amountOfMoneyLabel: UILabel = UILabel()
	let operationButton: UIButton = UIButton()

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
	private enum Constants {
		static let labelWidth: CGFloat = 300
		static let topAnchor: CGFloat = 20
	}

	private func setupTreatmentImageView() {
		addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topAnchor),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 60),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: 60)])


		treatmentImageView.image = UIImage(systemName: "clock")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
	}

	//MARK: -StatusLabel
	private func setupStatusLabel() {
		addSubview(statusLabel)
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: Constants.topAnchor),
									 statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth)])

		statusLabel.mainLabel(title: "Перевод в обработке...")
	}

	//MARK: -AtributeTransactionLabel
	private func setupAtributeTransactionLabel() {
		addSubview(atributeTransactionLabel)
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: Constants.topAnchor),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth)])

		atributeTransactionLabel.subLabel(title: "Сумма перевода")
	}

	//MARK: -AmountOfMoneyLabel
	private func setupAmountOfMoneyLabel() {
		addSubview(amountOfMoneyLabel)
		NSLayoutConstraint.activate([amountOfMoneyLabel.topAnchor.constraint(equalTo: atributeTransactionLabel.bottomAnchor, constant: Constants.topAnchor / 2),
									 amountOfMoneyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 amountOfMoneyLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth)])

		amountOfMoneyLabel.mainLabel(title: "money")
	}

	//MARK: -OperationButton
	private func setupOperationButton() {
		addSubview(operationButton)
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)])

		operationButton.styleButton(title: "Перейти в контакты")
	}

}
