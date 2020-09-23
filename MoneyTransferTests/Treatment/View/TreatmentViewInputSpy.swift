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
	var didSetTitleAmountOfMoneyLabel: Bool = false
	var didSetTitleForStatusLabel: Bool = false
	var didSetTargetOnOperationButton: Bool = false

	func setView() {
		didSetView = true
	}

	func setTitleAmountOfMoneyLabel(with amount: String) {
		didSetTitleAmountOfMoneyLabel = true
	}

	func setTitleForStatusLabel(title: String) {
		didSetTitleForStatusLabel = true
	}

	func setTargetOnOperationButton() {
		didSetTargetOnOperationButton = true
	}
	
}
