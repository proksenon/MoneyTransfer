//
//  NameViewOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContainerViewOutput: class {
	///  Конфигурирует вью
	func configureView()
	///  Переключает контроллер
	func togleTransaction(on vc: ChildsController?)
	///  Двигает вверх или низ вюшку
	func moveTransaction(on viewSize: ViewSize)
	///  Принимает сумму транзакции
	func transactionMoneyIs(amount: String?)
	///  Выходит с модуля  Container
	func dissmis()
	///  При успешной операции вызовает отложено вью Success
	func succesOperation()
	///  Устанавливает баланс
	func setBalance(balance: String?)
	///  Получает баланс
	func getBalance() ->Balance?
	///  Показывает выводилась ли информация о успешной операции
	func showStatus() -> Bool
	///  Устанавливает вид операции
	func setOperation(operation: Operations)
	///  Отображает или скывает вьюшки
	func showTransactionView(show: Bool, viewSize: ViewSize?, showVC: ChildsController)
}
