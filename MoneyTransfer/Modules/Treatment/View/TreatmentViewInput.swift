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
	///  Устанавливает таргет на кнопку Операции
	func setTargetOnOperationButton()
	///  Записывает тайтл для суммы транзакции
	func setTitleAmountOfMoneyLabel(with amount: String)
	///  Записывает тайтл для Статус Лейбла
	func setTitleForStatusLabel(title: String)
}
