//
//  ContactViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContactViewInput: class {
	func setupAvatarImageView()
	func setupFullNameLabel()
	func setDataToAvatar(with data: Data?)
	func setBackgroundColor()
	func setFullName(with name: String)
	func setupPhoneNumberLabel()
	func setPhoneNumber(with phone: String)
	func setupRequestMoneyButton()
	func setupSendMoneyButton()
	func setupDimmView()
	func dimmViewIsHidden(_ isHidden: Bool)
}
