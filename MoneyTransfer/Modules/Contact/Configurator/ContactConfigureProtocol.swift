//
//  ContactConfigureProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол конфигуратора модуля Contact
protocol ContactConfiguratorProtocol: class {
	///  Конфигурирует Module Contact
	func configure(with viewController: ContactViewController)
}
