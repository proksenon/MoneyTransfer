//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol SuccessOperationViewInput: class {
	func setView()
	func setupTreatmentImageView()
	func setupStatusLabel()
	func setupAtributeTransactionLabel()
	func setupAmountOfMoneyLabel()
	func setupOperationButton()
	func setTitleAmountOfMoneyLable(with amount: String)
	func setupChangeBalanceLabel()
	func setupBeforeTransactionBalanceLabel()
	func setOldBalance(oldBalance: String)
	func setupCurrentBalanceLabel()
	func setCurrentBalance(balance: String)
}
