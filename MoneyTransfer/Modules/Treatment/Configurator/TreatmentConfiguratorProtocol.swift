//
//  TreatmentConfiguratorProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол конфигуратора модуля Treatment
protocol TreatmentConfiguratorProtocol: class {
	///  Конфигурирует Treatment
	func configure(with viewController: TreatmentViewController)
}
