//
//  NameModuleInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol TreatmentModuleInput: class {
	///  Конфигурирует Treatment
	func configure(amountOfTransaction: String, operation: Operations)
}
