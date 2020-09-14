//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController {

	var output: TreatmentViewOutput?
	var moduleInput: TreatmentModuleInput?
	var moduleOutput: ExitDelegate?
	var treatmentImageView: UIImageView?
	var statusLabel: UILabel?
	var atributeTransactionLabel: UILabel?
	var amountOfMoneyLabel: UILabel?
	var operationButton: UIButton?
	var money: String = "100000"

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
        // Do any additional setup after loading the view.
    }


}

extension TreatmentViewController: TreatmentViewInput {
	func setView() {
		view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
		view.backgroundColor = .white
		view.roundedCorner(with: 20)
	}

	func setupTreatmentImageView() {
		let treatmentImageView = UIImageView()
		view.addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 60),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: 60)])


		treatmentImageView.image = UIImage(systemName: "clock")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
		self.treatmentImageView = treatmentImageView
	}

	func setupStatusLabel() {
		guard let treatmentImageView = treatmentImageView else { return }
		let statusLabel = UILabel()
		view.addSubview(statusLabel)
		statusLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: 20),
									 statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 statusLabel.widthAnchor.constraint(equalToConstant: 300)])
		
		statusLabel.mainLabel(title: "Перевод в обработке...")
		self.statusLabel = statusLabel
	}

	func setupAtributeTransactionLabel() {
		guard let statusLabel = statusLabel else { return }
		let atributeTransactionLabel = UILabel()
		view.addSubview(atributeTransactionLabel)
		atributeTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: 300)])

		atributeTransactionLabel.subLabel(title: "Сумма перевода")
		self.atributeTransactionLabel = atributeTransactionLabel
	}

	func setupAmountOfMoneyLabel() {
		guard let atributeTransactionLabel = atributeTransactionLabel else { return }
		let amountOfMoneyLabel = UILabel()
		view.addSubview(amountOfMoneyLabel)
		amountOfMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([amountOfMoneyLabel.topAnchor.constraint(equalTo: atributeTransactionLabel.bottomAnchor, constant: 10),
									 amountOfMoneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 amountOfMoneyLabel.widthAnchor.constraint(equalToConstant: 300)])

		amountOfMoneyLabel.mainLabel(title: money)
		self.amountOfMoneyLabel = amountOfMoneyLabel
	}
	func setTitleAmountOfMoneyLable(with amount: String) {
		guard let amountOfMoneyLabel = amountOfMoneyLabel else { return }
		amountOfMoneyLabel.text = amount
	}

	func setupOperationButton() {
		let operationButton = UIButton()
		view.addSubview(operationButton)
		operationButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
									 operationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
									 operationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)])
		
		operationButton.styleButton(title: "Перейти в контакты")
		operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
		self.operationButton = operationButton
	}
	@IBAction func operationButtonDidTapped() {
		moduleOutput?.backToContacts()
		print("goToContact")
	}

}
