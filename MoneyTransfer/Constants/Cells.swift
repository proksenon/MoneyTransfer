//
//  CellsHeight.swift
//  MoneyTransfer
//
//  Created by 18579132 on 24.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Аргументы ячеек
enum Cells {
	/// Высота ячеек
	enum CellsID: String {
		case cardCell
		case defaultCell
	}

	enum CellsHeight {
		/// Выстоа ячейки с картой
		static let cardCell: CGFloat = 300
		/// Высота дефолтной ячейки
		static let defaultCell = ViewConstatns.height / 11
	}
}
