//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol ContainerViewInput: class {
	///  Устанавливает затемнение
	func setupDimmView()
	///  Устанавливает тап по затемнению
	func tapOutSite()
	///  Отображает или скывает вьюшки
	func showTransactionView(show: Bool, y: CGFloat?, showVC: ChildsController)
	///  Устанавливает контакт в Модуль Contact
	func setPersonAtContactView(with person: Person)
	///  Устанавливает сумму операции в Treatment
	func setAmountAtTreatmentController(with amount: String, operation: Operations)
	///  Устанавливает баланс в Success
	func setDataAtSuccesViewController(with balance: Balance)
	///  Устанавливает вид операции в Transaction
	func setOperationAtTransactionView(operation: Operations)
}
