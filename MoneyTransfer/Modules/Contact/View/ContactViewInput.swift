//
//  ContactViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContactViewInput: class {
	///  Ставит картинку в аватарку
	func setDataToAvatar(with data: Data?)
	///  Устанавливает имя и фамилию в лейбл
	func setFullName(with name: String)
	///  Меняет цвет вьюшки
	func setViewColor()
	///  Записывает телефон в лейбл
	func setPhoneNumber(with phone: String)
	///  Устанавливает таргет на кнопку Запроса денег
	func setTargetRequestMoneyButton()
	///  Устанавливает target на кнопку Отправки денег
	func setTargetOnSendMoneyButton()
}
