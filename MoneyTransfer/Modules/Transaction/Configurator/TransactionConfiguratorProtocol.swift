//
//  TransactionConfiguratorProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол конфигуратора модуля Transaction
protocol TransactionConfiguratorProtocol: class {
	func configure(with viewController: TransactionViewController)
}
