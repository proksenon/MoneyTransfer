//
//  TransactionViewOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TransactionViewOutput: class {
	///  Конфигурирует View
	func configureView()
	///  Проверяет баланс
	func checkBalance()
	///  Получает баланс
	func getBalance() -> String?
	///  Устанавливает баланс
	func setNewBalance()
	///  Проверяет символы в ТекстФилд
	func checkTextFieldString(text: String?, string: String)-> Bool
	///  Меняет запятую на точку
	func formatingTextField()->String?
}
