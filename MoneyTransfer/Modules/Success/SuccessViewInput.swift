//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol SuccessOperationViewInput: class {
	///  Настраивает вью
	func setView()
	///  Устанавливает таргет на кнопку операции
	func setTargetOnOperationButton()
	///  устанавливает title для суммы транзакции
	func setTitleAmountOfMoneyLable(with amount: String)
	///  Записывает старый баланс
	func setOldBalance(oldBalance: String)
	///  Записывает в лейбл новый баланс
	func setCurrentBalance(balance: String)
}
