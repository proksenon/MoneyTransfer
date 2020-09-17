//
//  TransactionInteractorInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class TransactionInteractorInputSpy: TransactionInteractorInput {

	var didGetBalance: Bool = false
	var didSetBalance: Bool = false
	var balance: String?

	func getBalance() -> String? {
		didGetBalance = true
		return balance
	}

	func setBalance(balance: String) {
		didSetBalance = true
	}


}
