//
//  TransactionViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TransactionViewInput: class {
	///  Текст с MoneyTextFiels
	func textFieldText()-> String?
	///  Настройка текстфилда
	func setupMoneyTextField()
	///  Устанавливает кнопку операции
	func setTargetOnOperationButton()
	///  Устанавливает вью
	func setView()
	///  Ставит уведомление на клавиатуру
	func setupNotificationKeyboard()
	///  Меняет цвет текстФилда на результат операции
	func changeCornerColorMoneyTextField(result: Status)
	///  Выключает или включает кнопку операции
	func operationButtonIsEnabled(isEnabled: Bool)
	///  Устанавливает Title для Operation кнопки
	func setTitleForOperationButton(title: String)
	///  Устанавливает Title для Operation лейбла
	func setTitleForOperationLabel(title: String)
}
