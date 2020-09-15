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
	///  Устанавливает картинку успешной операции
	func setupTreatmentImageView()
	///  Устанавливает статус операции лейбл
	func setupStatusLabel()
	///  Устанавливает атрибут транзакции
	func setupAtributeTransactionLabel()
	///  Устанавливает лейб суммы транзакции
	func setupAmountOfMoneyLabel()
	///  Устанавливает кнопку перехода в контакты
	func setupExitButton()
	///  устанавливает title для суммы транзакции
	func setTitleAmountOfMoneyLable(with amount: String)
	///  Устанавливает лейбл "Изменение баланса"
	func setupChangeBalanceLabel()
	///  Устанавливает лейбл старого баланса
	func setupBeforeTransactionBalanceLabel()
	///  Записывает старый баланс
	func setOldBalance(oldBalance: String)
	///  Устанавливает лейбл нового баланса
	func setupCurrentBalanceLabel()
	///  Записывает в лейбл новый баланс
	func setCurrentBalance(balance: String)
}
