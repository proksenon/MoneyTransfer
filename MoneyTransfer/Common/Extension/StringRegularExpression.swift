//
//  StringRegularExpression.swift
//  MoneyTransfer
//
//  Created by 18579132 on 28.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

extension String {
	/// Ищет совпаления
	/// - Parameter expression: Строка параметров поиска
	/// - Returns: Есть совпадение или нет
	func matches(_ expression: String) -> Bool {
		if let range = range(of: expression, options: .regularExpression, range: nil, locale: nil) {
			return range.lowerBound == startIndex && range.upperBound == endIndex
		} else {
			return false
		}
	}
}
