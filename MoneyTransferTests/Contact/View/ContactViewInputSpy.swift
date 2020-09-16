//
//  ContactViewInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContactViewInputSpy: ContactViewInput {

	var didSetupAvatarImageView: Bool = false
	var didSetDataToAvatar: Bool = false
	var didSetupFullNameLabel: Bool = false
	var didSetFullName: Bool = false
	var didSetBackgroundColor: Bool = false
	var didSetupPhoneNumberLabel: Bool = false
	var didSetPhoneNumber: Bool = false
	var didSetupRequestMoneyButton: Bool = false
	var didSetupSendMoneyButton: Bool = false

	func setupAvatarImageView() {
		didSetupAvatarImageView = true
	}

	func setDataToAvatar(with data: Data?) {
		didSetDataToAvatar = true
	}

	func setupFullNameLabel() {
		didSetupFullNameLabel = true
	}

	func setFullName(with name: String) {
		didSetFullName = true
	}

	func setBackgroundColor() {
		didSetBackgroundColor = true
	}

	func setupPhoneNumberLabel() {
		didSetupPhoneNumberLabel = true
	}

	func setPhoneNumber(with phone: String) {
		didSetPhoneNumber = true
	}

	func setupRequestMoneyButton() {
		didSetupRequestMoneyButton = true
	}

	func setupSendMoneyButton() {
		didSetupSendMoneyButton = true
	}


}
