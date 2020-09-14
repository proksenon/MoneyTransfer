//
//  TransactionViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TransactionViewInput: class {
	func setupNameOperationLabel()
	func setupMoneyTextfield()
	func setupOperationButton()
	func setView()
	func setupNotificationKeyboard()
	func changeCornerColorMoneyTextField(result: Status)
	func operationButtonIsEnabled(isEnabled: Bool)
	func setTitleForOperationButton(title: String)
	func setTitleForOperationLabel(title: String)
}
