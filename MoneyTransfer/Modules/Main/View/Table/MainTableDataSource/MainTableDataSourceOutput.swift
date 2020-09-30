//
//  MainTableDataSourceOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 24.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол output кастомной DataSource
protocol MainTableDataSourceOutput: AnyObject {
	///  Возвращает количество контактов
	func countOfPersons()->Int
	func itemCell(with indexPath: IndexPath)-> CellItemProtocol
}
