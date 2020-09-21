//
//  MoneyString.swift
//  MoneyTransfer
//
//  Created by 18579132 on 21.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension String {

	subscript (i: Int) -> String {

		if self.count > i {

			return String(Array(self)[i])
		}

		return ""
	}

	func moneyFormat()-> String {
		let array = self.components(separatedBy: ".")
		var intPartOfMoney = Array(array[0])


		let countZero: Int = (intPartOfMoney.count - 1) / 3

		guard countZero > 0 else { return self }
		for index in 1...countZero {
			intPartOfMoney.insert(" ", at: intPartOfMoney.count - (index * 3))
		}

		return String(intPartOfMoney) + "." + (array.count == 1 ? "" : array[1])
	}
}

