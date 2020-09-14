//
//  TransactionViewOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TransactionViewOutput: class {
	func configureView()
	func checkBalance(transaction: String?)
	func getBalance() -> String?
	func setNewBalance(transaction: String?)
}
