//
//  NameModuleInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContainerModuleInput: class {
	///  Конфигурирует модуль Container
	func configure(with person: Person)
}
