//
//  SuccessView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// View модуля Success
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
		let frame = CGRect(x: 0, y: 0, width: ViewConstatns.width, height: ChildsAtributes.Hight.success)
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

	/// Константы для констрейнтов
	private enum Constants {
		/// Ширина лейблов
		static let labelWidth: CGFloat = 300
		/// Отступ сверху
		static let topAnchor: CGFloat = 20
		/// Отступы по бокам
		static let spacing: CGFloat = 10
	}

	//MARK: -TreatmentImageView
	/// Настройка картинки ожидания
	private func setupTreatmentImageView() {
		addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topAnchor),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: ChildsImageSize.height),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: ChildsImageSize.width)])


		treatmentImageView.image = UIImage(systemName: Images.checkMark)?.withTintColor(.green, renderingMode: .alwaysOriginal)
	}

	//MARK: -StatusLabel
	/// Настройка лейбла статуса операции
	private func setupStatusLabel() {
		addSubview(statusLabel)

		statusLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: Constants.topAnchor),
									 statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth),
									 statusLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.mainLabelHeight)])

		statusLabel.decorate(with: MainLabelDecorator(title: Labels.transferSuccess))
	}

	//MARK: -AtributeTransactionLabel
	/// Настройка лейбла Атрибутов транзакции
	private func setupAtributeTransactionLabel() {
		addSubview(atributeTransactionLabel)

		atributeTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: Constants.topAnchor),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth),
									 atributeTransactionLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.subLabelHeight)])

		atributeTransactionLabel.decorate(with: SubLabelDecorator(title: Labels.transfered))
	}

	//MARK: -AmountOfMoneyLabel
	/// Настройка лейбла с суммой транзакции
	private func setupAmountOfMoneyLabel() {
		addSubview(amountOfMoneyLabel)

		amountOfMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([amountOfMoneyLabel.topAnchor.constraint(equalTo: atributeTransactionLabel.bottomAnchor, constant: Constants.topAnchor / 2),
									 amountOfMoneyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 amountOfMoneyLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth),
									 amountOfMoneyLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.mainLabelHeight)])

		amountOfMoneyLabel.decorate(with: MainLabelDecorator(title: ""))
	}

	//MARK: -OperationButton
	/// Настройка кнопки выхода
	private func setupExitButton() {
		addSubview(operationButton)

		operationButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ChildsButton.bottomAchor),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: ChildsButton.leftAchor),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: ChildsButton.rightAchor),
									 operationButton.heightAnchor.constraint(equalToConstant: ChildsButton.transactionHeight)])

		operationButton.decorate(with: [TransactionButtonDecorator(title: Labels.goToContacts), CornerRadiusDecorator(cornerRadius: 15)])
	}

	//MARK: -ChangeBalanceLabel
	/// Настройка лейбла изменения баланса
	private func setupChangeBalanceLabel() {
		addSubview(changeBalanceLabel)

		changeBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([changeBalanceLabel.topAnchor.constraint(equalTo: amountOfMoneyLabel.bottomAnchor, constant: Constants.topAnchor),
									 changeBalanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 changeBalanceLabel.widthAnchor.constraint(equalToConstant: ViewConstatns.width),
									 changeBalanceLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.subLabelHeight)])

		changeBalanceLabel.decorate(with: SubLabelDecorator(title: Labels.balanceChange))
	}

	//MARK: -BeforeTransactionBalanceLabel
	/// Настройка лейбла со старым балансом
	private func setupBeforeTransactionBalanceLabel() {
		addSubview(beforeTransactionBalanceLabel)

		beforeTransactionBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([beforeTransactionBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: Constants.topAnchor/2),
									 beforeTransactionBalanceLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: -Constants.spacing/2),
									 beforeTransactionBalanceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.spacing),
									 beforeTransactionBalanceLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.subLabelHeight)])

		beforeTransactionBalanceLabel.decorate(with: [SubLabelDecorator(title: "0.00"), StrikeLabelDecorator(isStrikeThrough: true)])
		beforeTransactionBalanceLabel.textAlignment = .right
	}

	//MARK: -CurrentBalanceLabel
	/// Настройка лейбла с текущим балансом
	private func setupCurrentBalanceLabel() {
		addSubview(currentBalanceLabel)

		currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([currentBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: Constants.topAnchor / 2),
									 currentBalanceLabel.leftAnchor.constraint(equalTo: centerXAnchor, constant: Constants.spacing/2),
									 currentBalanceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.spacing),
									 currentBalanceLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.subLabelHeight)])

		currentBalanceLabel.decorate(with: SubLabelDecorator(title: ""))
		currentBalanceLabel.textAlignment = .left
		currentBalanceLabel.textColor = .black
	}
	
}
