//
//  TransactionViewInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class TransactionViewInputSpy: TransactionViewInput {

	var didSetupMoneyTextfield: Bool = false
	var didTakeTextFieldText: Bool = false
	var didSetView: Bool = false
	var didSetupNotificationKeyboard: Bool = false
	var didChangeCornerColorMoneyTextField: Bool = false
	var didOperationButtonIsEnabled: Bool = false
	var didSetTitleForOperationButton: Bool = false
	var didSetTitleForOperationLabel: Bool = false
	var didSetTargetOnOperationButton: Bool = false
	var text: String!

	func setupMoneyTextField() {
		didSetupMoneyTextfield = true
	}

	func textFieldText() -> String? {
		didTakeTextFieldText = true
		return text
	}

	func setView() {
		didSetView = true
	}

	func setupNotificationKeyboard() {
		didSetupNotificationKeyboard = true
	}

	func changeCornerColorMoneyTextField(result: Status) {
		didChangeCornerColorMoneyTextField = true
	}

	func operationButtonIsEnabled(isEnabled: Bool) {
		didOperationButtonIsEnabled = true
	}

	func setTitleForOperationButton(title: String) {
		didSetTitleForOperationButton = true
	}

	func setTitleForOperationLabel(title: String) {
		didSetTitleForOperationLabel = true
	}

	func setTargetOnOperationButton() {
		didSetTargetOnOperationButton = true
	}


}
