//
//  StringLocalized.swift
//  MoneyTransfer
//
//  Created by 18579132 on 25.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

extension String {
	/// Локализует строку
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
