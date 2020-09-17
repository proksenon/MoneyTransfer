//
//  TreatmentViewInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class TreatmentViewInputSpy: TreatmentViewInput {

	var didSetView: Bool = false
	var didSetupTreatmentImageView: Bool = false
	var didSetupStatusLabel: Bool = false
	var didSetupAtributeTransactionLabel: Bool = false
	var didSetupAmountOfMoneyLabel: Bool = false
	var didSetupOperationButton: Bool = false
	var didSetTitleAmountOfMoneyLabel: Bool = false
	var didSetTitleForStatusLabel: Bool = false

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

	func setupOperationButton() {
		didSetupOperationButton = true
	}

	func setTitleAmountOfMoneyLabel(with amount: String) {
		didSetTitleAmountOfMoneyLabel = true
	}

	func setTitleForStatusLabel(title: String) {
		didSetTitleForStatusLabel = true
	}

	
}
