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
	///  Получает баланс
	func getBalance() ->Balance?
	///  Показывает выводилась ли информация о успешной операции
	func showStatus() -> Bool
}
