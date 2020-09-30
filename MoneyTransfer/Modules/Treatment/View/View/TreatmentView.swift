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
		let frame = CGRect(x: 0, y: 0, width: ViewConstatns.width, height: ChildsAtributes.Hight.treatment)
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
									 treatmentImageView.heightAnchor.constraint(equalToConstant: ChildsImageSize.height),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: ChildsImageSize.width)])


		treatmentImageView.image = UIImage(systemName: Images.clock)?.withTintColor(.gray, renderingMode: .alwaysOriginal)
	}

	//MARK: -StatusLabel
	private func setupStatusLabel() {
		addSubview(statusLabel)

		statusLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: Constants.topAnchor),
									 statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth),
									 statusLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.mainLabelHeight)])

		statusLabel.decorate(with: MainLabelDecorator(title: Labels.transferProcessing))
	}

	//MARK: -AtributeTransactionLabel
	private func setupAtributeTransactionLabel() {
		addSubview(atributeTransactionLabel)

		atributeTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: Constants.topAnchor),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidth),
									 atributeTransactionLabel.heightAnchor.constraint(equalToConstant: ChildsLabels.subLabelHeight)])

		atributeTransactionLabel.decorate(with: SubLabelDecorator(title: Labels.transferAmount))
	}

	//MARK: -AmountOfMoneyLabel
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
	private func setupOperationButton() {
		addSubview(operationButton)

		operationButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ChildsButton.bottomAchor),
									 operationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: ChildsButton.leftAchor),
									 operationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: ChildsButton.rightAchor),
									 operationButton.heightAnchor.constraint(equalToConstant: ChildsButton.transactionHeight)])

		operationButton.decorate(with: [TransactionButtonDecorator(title: Labels.goToContacts), CornerRadiusDecorator(cornerRadius: 15)])
	}

}
