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
	var balance: String?
	var checkedStringIsCurrent: Bool = false
	var didFormatedTextField: Bool = false

	func configureView() {
		didConfigureView = true
	}

	func checkBalance() {
		didCheckBalance = true
	}

	func getBalance() -> String? {
		didGetBalance = true
		return balance
	}

	func setNewBalance() {
		didSetNewBalance = true
	}

	func checkTextFieldString(text: String?, string: String) -> Bool {
		didCheckedTextFieldString = true
		return checkedStringIsCurrent
	}

	func formatingTextField() -> String? {
		didFormatedTextField = true
		return balance
	}


}
