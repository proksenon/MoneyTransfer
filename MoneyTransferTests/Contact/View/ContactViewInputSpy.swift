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

	var didSetDataToAvatar: Bool = false
	var didSetFullName: Bool = false
	var didSetBackgroundColor: Bool = false
	var didSetPhoneNumber: Bool = false
	var didSetTargetRequestMoneyButton: Bool = false
	var didSetTargetOnSendMoneyButton: Bool = false

	func setDataToAvatar(with data: Data?) {
		didSetDataToAvatar = true
	}

	func setFullName(with name: String) {
		didSetFullName = true
	}

	func setViewColor() {
		didSetBackgroundColor = true
	}


	func setPhoneNumber(with phone: String) {
		didSetPhoneNumber = true
	}
	func setTargetRequestMoneyButton() {
		didSetTargetRequestMoneyButton = true
	}

	func setTargetOnSendMoneyButton() {
		didSetTargetOnSendMoneyButton = true
	}
}
