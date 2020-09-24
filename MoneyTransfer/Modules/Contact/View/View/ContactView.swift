//
//  ContactView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class ContactView: UIView {

	let avatarImageView: UIImageView = UIImageView()
	let fullNameLabel: UILabel = UILabel()
	let phoneNumberLabel: UILabel = UILabel()
	let requestMoneyButton: UIButton = UIButton()
	let sendMoneyButton: UIButton = UIButton()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupAvatarImageView()
		setupFullNameLabel()
		setupPhoneNumberLabel()
		setupRequestMoneyButton()
		setupSendMoneyButton()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: -AvatarImageView
	private func setupAvatarImageView() {
		addSubview(avatarImageView)

		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -110),
									 avatarImageView.widthAnchor.constraint(equalToConstant: ViewConstatns.width/2),
									 avatarImageView.heightAnchor.constraint(equalToConstant: ViewConstatns.width/2)])
		avatarImageView.image = UIImage(named: Images.unknown)
		avatarImageView.contentMode = .scaleAspectFill
		avatarImageView.roundedCorner(with: ViewConstatns.width/4)
	}

	//MARK: -FullNameLabel
	private func setupFullNameLabel() {
		addSubview(fullNameLabel)

		fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)])

		fullNameLabel.text = "Surname Name"
		fullNameLabel.font = fullNameLabel.font.withSize(35)
		fullNameLabel.textColor = .black
	}

	//MARK: -PhoneNumberLabel
	private func setupPhoneNumberLabel() {
		addSubview(phoneNumberLabel)
		phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([phoneNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 phoneNumberLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 5)])
		phoneNumberLabel.text = "+799999999"
		phoneNumberLabel.textColor = .darkGray
		phoneNumberLabel.font = phoneNumberLabel.font.withSize(15)
	}

	//MARK: -RequestMoneyButton
	private func setupRequestMoneyButton() {
		addSubview(requestMoneyButton)

		NSLayoutConstraint.activate([requestMoneyButton.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 70),
									 requestMoneyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
									 requestMoneyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)])

		requestMoneyButton.contactStyleButton(title: "Запросить деньги")
	}

	//MARK: -SendMoneyButton
	private func setupSendMoneyButton() {
		addSubview(sendMoneyButton)

		NSLayoutConstraint.activate([sendMoneyButton.topAnchor.constraint(equalTo: requestMoneyButton.bottomAnchor, constant: 10),
									 sendMoneyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
									 sendMoneyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)])

		sendMoneyButton.contactStyleButton(title: "Отправить деньги")
	}

}
