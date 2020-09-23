//
//  SuccessViewInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class SuccessViewInputSpy: SuccessOperationViewInput {

	var didSetView: Bool = false
	var didSetTitleAmountOfMoneyLable: Bool = false
	var didSetOldBalance: Bool = false
	var didSetCurrentBalance: Bool = false
	var didSetTargetOnOperationButton: Bool = false

	func setView() {
		didSetView = true
	}

	func setTitleAmountOfMoneyLable(with amount: String) {
		didSetTitleAmountOfMoneyLable = true
	}

	func setOldBalance(oldBalance: String) {
		didSetOldBalance = true
	}

	func setCurrentBalance(balance: String) {
		didSetCurrentBalance = true
	}

	func setTargetOnOperationButton() {
		didSetTargetOnOperationButton = true
	}


}
