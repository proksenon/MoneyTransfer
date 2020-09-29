//
//  MainModuleInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 13.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainMouduleInput {
	///  Принимает баланс  и переменную шоу, если шоу = тру, то показывает статус операции по завершению
	func statusTransaction(with balance: BalanceOperation?, show: Bool)
}
