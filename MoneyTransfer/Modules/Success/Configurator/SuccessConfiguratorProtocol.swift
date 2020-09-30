//
//  SuccessOperationConfiguratorProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол конфигуратора модуля Success
protocol SuccessOperationConfiguratorProtocol: class {
	/// Конфигурирует модуль Success
	/// - Parameter viewController: viewController Модуля Success
	func configure(with viewController: SuccessOperationViewController)
}
