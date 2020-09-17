//
//  TransactionViewOutSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class TransactionViewOutputSpy: TransactionViewOutput {

	var didConfigureView: Bool = false
	var didCheckBalance: Bool = false
	var didGetBalance: Bool = false
	var didSetNewBalance: Bool = false
	var didCheckedTextFieldString: Bool = false
	var didCheckedExcessSymbols: Bool = false
	var balance: String?
	var checkedStringIsCurrent: Bool = false

	func configureView() {
		didConfigureView = true
	}

	func checkBalance(transaction: String?) {
		didCheckBalance = true
	}

	func getBalance() -> String? {
		didGetBalance = true
		return balance
	}

	func setNewBalance(transaction: String?) {
		didSetNewBalance = true
	}

	func checkTextFieldString(string: String) -> Bool {
		didCheckedTextFieldString = true
		return checkedStringIsCurrent
	}

	func checkExcessSymbols(text: String?) -> String? {
		didCheckedExcessSymbols = true
		return text
	}


}