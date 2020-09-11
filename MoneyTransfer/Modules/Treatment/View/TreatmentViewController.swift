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
		view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 450)
		view.backgroundColor = .white
		view.roundedCorner(with: 20)
	}

	func setupTreatmentImageView() {
		let treatmentImageView = UIImageView()
		view.addSubview(treatmentImageView)
		treatmentImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([treatmentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 treatmentImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 40)])

		treatmentImageView.image = UIImage(systemName: "clock")
		treatmentImageView.image?.withTintColor(.systemGray2)
		self.treatmentImageView = treatmentImageView
	}

	func setupStatusLabel() {
		guard let treatmentImageView = treatmentImageView else { return }
		let statusLabel = UILabel()
		view.addSubview(statusLabel)
		statusLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([statusLabel.topAnchor.constraint(equalTo: treatmentImageView.bottomAnchor, constant: 20),
									 statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 statusLabel.heightAnchor.constraint(equalToConstant: 20),
									 statusLabel.widthAnchor.constraint(equalToConstant: 100)])
		statusLabel.backgroundColor = .clear
		statusLabel.font = UIFont(name: "Futura Medium", size: 18)
		statusLabel.text = "Перевод в обработке..."
		self.statusLabel = statusLabel
	}

	func setupAtributeTransactionLabel() {
		guard let statusLabel = statusLabel else { return }
		let atributeTransactionLabel = UILabel()
		view.addSubview(atributeTransactionLabel)
		atributeTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([atributeTransactionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
									 atributeTransactionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 atributeTransactionLabel.heightAnchor.constraint(equalToConstant: 10),
									 atributeTransactionLabel.widthAnchor.constraint(equalToConstant: 100)])

		atributeTransactionLabel.backgroundColor = .clear
		atributeTransactionLabel.font = atributeTransactionLabel.font.withSize(10)
		atributeTransactionLabel.textColor = .systemGray6
		atributeTransactionLabel.text = "Сумма перевода"
		self.atributeTransactionLabel = atributeTransactionLabel
	}

	func setupAmountOfMoneyLabel() {
		guard let atributeTransactionLabel = atributeTransactionLabel else { return }
		let amountOfMoneyLabel = UILabel()
		view.addSubview(amountOfMoneyLabel)
		amountOfMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([amountOfMoneyLabel.topAnchor.constraint(equalTo: atributeTransactionLabel.bottomAnchor, constant: 10),
									 amountOfMoneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 amountOfMoneyLabel.heightAnchor.constraint(equalToConstant: 20),
									 amountOfMoneyLabel.widthAnchor.constraint(equalToConstant: 100)])

		amountOfMoneyLabel.backgroundColor = .clear
		amountOfMoneyLabel.font = amountOfMoneyLabel.font.withSize(18)
		amountOfMoneyLabel.textColor = .black
		amountOfMoneyLabel.text = money
		self.amountOfMoneyLabel = amountOfMoneyLabel
	}

	func setupOperationButton() {
			let operationButton = UIButton()
			view.addSubview(operationButton)
			operationButton.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([operationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
										 operationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
										 operationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
										 operationButton.heightAnchor.constraint(equalToConstant: 40)])
			operationButton.backgroundColor = .systemGray2
			operationButton.setTitle("Перевести", for: .normal)
			operationButton.titleLabel?.textColor = .white
			operationButton.isUserInteractionEnabled = false
			operationButton.roundedCorner(with: 15)
			operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
			self.operationButton = operationButton
		}
	@IBAction func operationButtonDidTapped() {
		print("goToContact")
	}

}
