//
//  TransactionInteractorInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TransactionInteractorInput: class {
	func getBalance()-> String?
	func setBalance(balance: String)
}
