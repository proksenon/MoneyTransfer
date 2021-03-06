//
//  NameConfiguratorProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол конфигуратора модуля Container
protocol ContainerConfiguratorProtocol: class {
	///  Конфигурирует модуль Container
	func configure(with viewController: ContainerViewController)
}
