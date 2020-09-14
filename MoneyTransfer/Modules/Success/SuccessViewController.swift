//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class SuccessOperationViewController: UIViewController {

	var output: SuccessOperationViewOutput?
	var moduleInput: SuccessOperationModuleInput?
	var moduleOutput: ExitDelegate?
	var treatmentImageView: UIImageView?
	var statusLabel: UILabel?
	var atributeTransactionLabel: UILabel?
	var amountOfMoneyLabel: UILabel?
	var operationButton: UIButton?
	var changeBalanceLabel: UILabel?
	var beforeTransactionBalanceLabel: UILabel?
	var currentBalanceLabel: UILabel?
	var money: String = "100000"
	

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
        // Do any additional setup after loading the view.
    }


}

extension SuccessOperationViewController: SuccessOperationViewInput {

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
									 treatmentImageView.heightAnchor.constraint(equalToConstant: 60),
									 treatmentImageView.widthAnchor.constraint(equalToConstant: 60)])


		treatmentImageView.image = UIImage(systemName: "checkmark.circle")?.withTintColor(.green, renderingMode: .alwaysOriginal)
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
		
		statusLabel.mainLabel(title: "Перевод прошел успешно")
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

		atributeTransactionLabel.subLabel(title: "Переведено")
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

		amountOfMoneyLabel.mainLabel(title: "money")
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

	func setupChangeBalanceLabel() {
		let changeBalanceLabel = UILabel()
		view.addSubview(changeBalanceLabel)
		changeBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		guard let amountOfMoneyLabel = amountOfMoneyLabel else { return }
		NSLayoutConstraint.activate([changeBalanceLabel.topAnchor.constraint(equalTo: amountOfMoneyLabel.bottomAnchor, constant: 20),
									 changeBalanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 changeBalanceLabel.widthAnchor.constraint(equalToConstant: 300)])

		changeBalanceLabel.subLabel(title: "Изменение баланса")
		self.changeBalanceLabel = changeBalanceLabel
	}

	func setupBeforeTransactionBalanceLabel() {
		let beforeTransactionBalanceLabel = UILabel()
		view.addSubview(beforeTransactionBalanceLabel)
		beforeTransactionBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		guard let changeBalanceLabel = changeBalanceLabel else { return }
		NSLayoutConstraint.activate([beforeTransactionBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: 10),
									 beforeTransactionBalanceLabel.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
									 beforeTransactionBalanceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)])

		beforeTransactionBalanceLabel.subLabel(title: "999999")
		beforeTransactionBalanceLabel.strikeThrough(true)
		beforeTransactionBalanceLabel.textAlignment = .right
		self.beforeTransactionBalanceLabel = beforeTransactionBalanceLabel
	}
	func setOldBalance(oldBalance: String) {
		guard let beforeTransactionBalanceLabel = beforeTransactionBalanceLabel else { return }
		beforeTransactionBalanceLabel.text = oldBalance
	}

	func setupCurrentBalanceLabel() {
		let currentBalanceLabel = UILabel()
		view.addSubview(currentBalanceLabel)
		currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		guard let changeBalanceLabel = changeBalanceLabel else { return }
		NSLayoutConstraint.activate([currentBalanceLabel.topAnchor.constraint(equalTo: changeBalanceLabel.bottomAnchor, constant: 10),
									 currentBalanceLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
									 currentBalanceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)])

		currentBalanceLabel.subLabel(title: "999999")
		currentBalanceLabel.textAlignment = .left
		currentBalanceLabel.textColor = .black
		self.currentBalanceLabel = currentBalanceLabel
	}
	func setCurrentBalance(balance: String) {
		guard let currentBalanceLabel = currentBalanceLabel else { return }
		currentBalanceLabel.text = balance
	}

}

extension UILabel {
	func subLabel(title: String) {
		self.backgroundColor = .clear
		self.font = self.font.withSize(14)
		self.textColor = .gray
		self.textAlignment = .center
		self.text = title
		self.heightAnchor.constraint(equalToConstant: 15).isActive = true
	}

	func mainLabel(title: String) {
		self.backgroundColor = .clear
		self.font = UIFont(name: "Futura Medium", size: 18)
		self.textAlignment = .center
		self.textColor = .black
		self.text = title
		self.heightAnchor.constraint(equalToConstant: 20).isActive = true
	}

	func strikeThrough(_ isStrikeThrough:Bool) {
    if isStrikeThrough {
        if let lblText = self.text {
            let attributeString =  NSMutableAttributedString(string: lblText)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
            self.attributedText = attributeString
        }
    } else {
        if let attributedStringText = self.attributedText {
            let txt = attributedStringText.string
            self.attributedText = nil
            self.text = txt
            return
        }
    }
    }
}

extension UIButton {

	func styleButton(title: String, color: UIColor = .green) {
		self.backgroundColor = color
		self.setTitle(title, for: .normal)
		self.titleLabel?.textColor = .white
		self.roundedCorner(with: 15)
		self.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}

}

