//
//  CellProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 29.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Протокол ячейки
protocol CellProtocol: UITableViewCell {
	/// Конфигурирует ячейку
	/// - Parameter item: Модель данных для конфигурации ячейки
	func configureCell(with item: CellItemProtocol)
}
