//
//  Balance.swift
//  MoneyTransfer
//
//  Created by 18579132 on 29.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Модель баланса
struct Balance: CellItemProtocol {
	var identifier: String = Cells.CellsID.cardCell.rawValue

	/// Текущий баланс
	var balance: String
}
