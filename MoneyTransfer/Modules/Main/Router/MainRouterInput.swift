//
//  MainRouterInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainRouterInput: class {
	///  Переходит на модуль Container
	func pushContainer(with person: Person)
	///  Показывает успешный статус операци
	func showSuccess(with balance: Balance)
	///  Закрывает статус успешной операии
	func dissmisSucces()
}
