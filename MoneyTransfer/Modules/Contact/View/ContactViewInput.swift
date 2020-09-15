//
//  ContactViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContactViewInput: class {
	///  Устанавливает аватарку контакта
	func setupAvatarImageView()
	///  Ставит картинку в аватарку
	func setDataToAvatar(with data: Data?)
	///  Устанавливает лейбл с именем
	func setupFullNameLabel()
	///  Устанавливает имя и фамилию в лейбл
	func setFullName(with name: String)
	///  Меняет цвет вьюшки
	func setBackgroundColor()
	///  Устанавливает лейбл с телефоном
	func setupPhoneNumberLabel()
	///  Записывает телефон в лейбл
	func setPhoneNumber(with phone: String)
	///  Устанавливает кнопку Запроса денег
	func setupRequestMoneyButton()
	///  Устанавливает кнопку Отправки денег
	func setupSendMoneyButton()
}
