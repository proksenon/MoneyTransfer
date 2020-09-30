//
//  ContactView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// View модуля Contact
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

	/// Константы
	private enum Constants {
		/// Отступ аватарки от центра по оси y
		static let avatarCenterY: CGFloat = -110
		/// Отступ для кнопок
		static let buttonSpacing: CGFloat = 25
		/// Отступ сверху
		static let top: CGFloat = 20
	}

	//MARK: -AvatarImageView
	/// Настраивает AvatarImageView
	private func setupAvatarImageView() {
		addSubview(avatarImageView)

		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
									 avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.avatarCenterY),
									 avatarImageView.widthAnchor.constraint(equalToConstant: ViewConstatns.width/2),
									 avatarImageView.heightAnchor.constraint(equalToConstant: ViewConstatns.width/2)])
		avatarImageView.image = UIImage(named: Images.unknown)
		avatarImageView.contentMode = .scaleAspectFill
		avatarImageView.decorate(with: CornerRadiusDecorator(cornerRadius: ViewConstatns.width/4))
	}

	//MARK: -FullNameLabel
	/// Настраивает лейбл с полным ФИО
	private func setupFullNameLabel() {
		addSubview(fullNameLabel)

		fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.top)])

		fullNameLabel.text = Labels.fullName
		fullNameLabel.font = fullNameLabel.font.withSize(35)
		fullNameLabel.textColor = .black
	}

	//MARK: -PhoneNumberLabel
	/// Настраивает лейбл с телефоном
	private func setupPhoneNumberLabel() {
		addSubview(phoneNumberLabel)
		phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([phoneNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
									 phoneNumberLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: Constants.top / 4)])
		phoneNumberLabel.text = "+799999999"
		phoneNumberLabel.textColor = .darkGray
		phoneNumberLabel.font = phoneNumberLabel.font.withSize(15)
	}

	//MARK: -RequestMoneyButton
	/// Устанавливает кнопку Запроса денег
	private func setupRequestMoneyButton() {
		addSubview(requestMoneyButton)

		requestMoneyButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([requestMoneyButton.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: Constants.top * 3),
									 requestMoneyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.buttonSpacing),
									 requestMoneyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.buttonSpacing),
									 requestMoneyButton.heightAnchor.constraint(equalToConstant: ChildsButton.contactHeight)])

		requestMoneyButton.decorate(with: [ContactButtonDecorator(title: Labels.requestMoney), CornerRadiusDecorator(cornerRadius: 4)])
	}

	//MARK: -SendMoneyButton
	/// Настраивает кнопку отправки денег
	private func setupSendMoneyButton() {
		addSubview(sendMoneyButton)

		sendMoneyButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([sendMoneyButton.topAnchor.constraint(equalTo: requestMoneyButton.bottomAnchor, constant: Constants.top / 2),
									 sendMoneyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.buttonSpacing),
									 sendMoneyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.buttonSpacing),
									 sendMoneyButton.heightAnchor.constraint(equalToConstant: ChildsButton.contactHeight)])

		sendMoneyButton.decorate(with: [ContactButtonDecorator(title: Labels.sendMoney), CornerRadiusDecorator(cornerRadius: 4)])
	}

}
