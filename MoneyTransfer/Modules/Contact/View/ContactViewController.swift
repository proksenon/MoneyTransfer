//
//  ContactViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

	var output: ContactViewOutput?
	var moduleInput: ContactModuleInput?
	var moduleOutput: TogleTransactionDelegate?
	var avatarImageView: UIImageView?
	var requestMoneyButton: UIButton?
	var sendMoneyButton: UIButton?
	var fullNameLabel: UILabel?
	var phoneNumberLabel: UILabel?
//	private lazy var dimmView: UIView = {
//		let view = UIView()
//		view.backgroundColor = UIColor.black.withAlphaComponent(1)
//		view.alpha = 0
//		return view
//	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()

        // Do any additional setup after loading the view.
    }
}

extension ContactViewController: ContactViewInput {


	func setBackgroundColor() {
		view.backgroundColor = .white
	}

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

	func setupRequestMoneyButton() {
		requestMoneyButton = UIButton()
		guard let requestMoneyButton = requestMoneyButton else { return }
		view.addSubview(requestMoneyButton)
		requestMoneyButton.roundedCorner(with: 4)

		requestMoneyButton.translatesAutoresizingMaskIntoConstraints = false
		guard let phoneNumberLabel = phoneNumberLabel else { return }
		NSLayoutConstraint.activate([requestMoneyButton.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 70),
									 requestMoneyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
									 requestMoneyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
									 requestMoneyButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/10)])
		requestMoneyButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
		requestMoneyButton.setTitle("Запросить деньги", for: .normal)
		requestMoneyButton.titleLabel?.text = "Запросить деньги"
		requestMoneyButton.titleLabel?.textColor = .black
		requestMoneyButton.addTarget(self, action: #selector(requestMoney), for: .touchUpInside)
	}
	@IBAction func requestMoney() {
		print("request")
	}

	func setupSendMoneyButton() {
		sendMoneyButton = UIButton()
		guard let sendMoneyButton = sendMoneyButton else { return }
		view.addSubview(sendMoneyButton)
		sendMoneyButton.roundedCorner(with: 4)

		sendMoneyButton.translatesAutoresizingMaskIntoConstraints = false
		guard let requestMoneyButton = requestMoneyButton else { return }
		NSLayoutConstraint.activate([sendMoneyButton.topAnchor.constraint(equalTo: requestMoneyButton.bottomAnchor, constant: 10),
									 sendMoneyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
									 sendMoneyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
									 sendMoneyButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/10)])

		sendMoneyButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
		sendMoneyButton.setTitle("Отправить деньги", for: .normal)
//		sendMoneyButton.titleLabel?.text = "Отправить деньги"
		sendMoneyButton.titleLabel?.textColor = .black
		sendMoneyButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
	}
//	func setupDimmView() {
//		dimmView.frame = view.frame
//		view.addSubview(dimmView)
//	}

//	func dimmViewIsHidden(_ isHidden: Bool) {
//		UIView.animate(withDuration: 0.4) {
//			self.dimmView.alpha = isHidden ? 0 : 0.6
//		}
//	}

	@IBAction func sendMoney() {
		print("sendMoney")
//		dimmViewIsHidden(false)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
//		output?.pushTransition()
	}
}
