//
//  NameViewOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContainerViewOutput: class {
	func configureView()
	func togleTransaction(on vc: ChildsController?)
	func moveTransaction(on viewSize: ViewSize)
	func transactionMoneyIs(amount: String?)
	func dissmis()
	func succesOperation()
	func setBalance(balance: String?)
}
