//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TreatmentViewInput: class {
	///  Настраивает View
	func setView()
	///  Устанавлиивает картинку обработки
	func setupTreatmentImageView()
	///  Устанавливает Статус лейбл
	func setupStatusLabel()
	///  Устанавливает Атрибут операции
	func setupAtributeTransactionLabel()
	///  Устанавливает лейбл суммы транзакции
	func setupAmountOfMoneyLabel()
	///  Устанавливает кнопку операции
	func setupOperationButton()
	///  Записывает тайтл для суммы транзакции
	func setTitleAmountOfMoneyLabel(with amount: String)
	///  Записывает тайтл для Статус Лейбла
	func setTitleForStatusLabel(title: String)
}
