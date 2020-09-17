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
	var didSetupTreatmentImageView: Bool = false
	var didSetupStatusLabel: Bool = false
	var didSetupAtributeTransactionLabel: Bool = false
	var didSetupAmountOfMoneyLabel: Bool = false
	var didSetupExitButton: Bool = false
	var didSetTitleAmountOfMoneyLable: Bool = false
	var didSetupChangeBalanceLabel: Bool = false
	var didSetupBeforeTransactionBalanceLabel: Bool = false
	var didSetOldBalance: Bool = false
	var didSetupCurrentBalanceLabel: Bool = false
	var didSetCurrentBalance: Bool = false

	func setView() {
		didSetView = true
	}

	func setupTreatmentImageView() {
		didSetupTreatmentImageView = true
	}

	func setupStatusLabel() {
		didSetupStatusLabel = true
	}

	func setupAtributeTransactionLabel() {
		didSetupAtributeTransactionLabel = true
	}

	func setupAmountOfMoneyLabel() {
		didSetupAmountOfMoneyLabel = true
	}

	func setupExitButton() {
		didSetupExitButton = true
	}

	func setTitleAmountOfMoneyLable(with amount: String) {
		didSetTitleAmountOfMoneyLable = true
	}

	func setupChangeBalanceLabel() {
		didSetupChangeBalanceLabel = true
	}

	func setupBeforeTransactionBalanceLabel() {
		didSetupBeforeTransactionBalanceLabel = true
	}

	func setOldBalance(oldBalance: String) {
		didSetOldBalance = true
	}

	func setupCurrentBalanceLabel() {
		didSetupCurrentBalanceLabel = true
	}

	func setCurrentBalance(balance: String) {
		didSetCurrentBalance = true
	}


}
