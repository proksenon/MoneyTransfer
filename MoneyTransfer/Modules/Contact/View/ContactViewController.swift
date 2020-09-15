//
//  ContactViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class ContactViewController: UIViewController {

	typealias TogleView = TogleTransactionDelegate & OperationDelegate
	var output: ContactViewOutput?
	var moduleInput: ContactModuleInput?
	var moduleOutput: TogleView?
	private var avatarImageView: UIImageView?
	private var requestMoneyButton: UIButton?
	private var sendMoneyButton: UIButton?
	private var fullNameLabel: UILabel?
	private var phoneNumberLabel: UILabel?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }
}
//MARK: -ContactViewInput
extension ContactViewController: ContactViewInput {


	func setBackgroundColor() {
		view.backgroundColor = .white
	}
	//MARK: -AvatarImageView
	func setupAvatarImageView() {
		avatarImageView = UIImageView()
		guard let avatarImageView = avatarImageView else { return }
		view.addSubview(avatarImageView)

		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 avatarImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110),
									 avatarImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
									 avatarImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2)])
		avatarImageView.image = UIImage(named: "defaultImage")
		avatarImageView.contentMode = .scaleAspectFit
	}

	func setDataToAvatar(with data: Data?) {
		guard let avatarImageView = avatarImageView, let data = data else { return }

		avatarImageView.image = UIImage(data: data)
	}
	//MARK: -FullNameLabel
	func setFullName(with name: String) {
		fullNameLabel?.text = name
	}

	func setupFullNameLabel() {
		fullNameLabel = UILabel()
		guard let fullNameLabel = fullNameLabel else { return }
		view.addSubview(fullNameLabel)

		fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
		guard let avatarImageView = avatarImageView else { return }
		NSLayoutConstraint.activate([fullNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)])

		fullNameLabel.text = "Surname Name"
		fullNameLabel.font = fullNameLabel.font.withSize(35)
	}
	
	//MARK: -PhoneNumberLabel
	func setupPhoneNumberLabel() {
		phoneNumberLabel = UILabel()
		guard let phoneNumberLabel = phoneNumberLabel else { return }
		view.addSubview(phoneNumberLabel)

		guard let fullNameLabel = fullNameLabel else { return }
		phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([phoneNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
									 phoneNumberLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 5)])
		phoneNumberLabel.text = "+799999999"
		phoneNumberLabel.textColor = .darkGray
		phoneNumberLabel.font = phoneNumberLabel.font.withSize(15)
	}

	func setPhoneNumber(with phone: String) {
		guard let phoneNumberLabel = phoneNumberLabel else { return }

		phoneNumberLabel.text = phone
	}

	//MARK: -RequestMoneyButton
	func setupRequestMoneyButton() {
		requestMoneyButton = UIButton()
		guard let requestMoneyButton = requestMoneyButton else { return }
		view.addSubview(requestMoneyButton)

		guard let phoneNumberLabel = phoneNumberLabel else { return }
		NSLayoutConstraint.activate([requestMoneyButton.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 70),
									 requestMoneyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
									 requestMoneyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)])

		requestMoneyButton.contactStyleButton(title: "Запросить деньги")
		requestMoneyButton.addTarget(self, action: #selector(requestMoney), for: .touchUpInside)
	}
	
	@IBAction private func requestMoney() {
		moduleOutput?.chooseOperation(operation: .request)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
	}

	//MARK: -SendMoneyButton
	func setupSendMoneyButton() {
		sendMoneyButton = UIButton()
		guard let sendMoneyButton = sendMoneyButton else { return }
		view.addSubview(sendMoneyButton)

		guard let requestMoneyButton = requestMoneyButton else { return }
		NSLayoutConstraint.activate([sendMoneyButton.topAnchor.constraint(equalTo: requestMoneyButton.bottomAnchor, constant: 10),
									 sendMoneyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
									 sendMoneyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)])

		sendMoneyButton.contactStyleButton(title: "Отправить деньги")
		sendMoneyButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
	}

	@IBAction private func sendMoney() {
		moduleOutput?.chooseOperation(operation: .transaction)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
	}
}
