//
//  UserDefaulsWORK.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Работа с UserDefaults
final class UserDefaultsWork: UserDefaultsWorkProtocol {
	/// UserDefaults
private let defaults: UserDefaults

init(defaults: UserDefaults = UserDefaults.standard) {
	self.defaults = defaults
}

	func setObject(for key: String, object: Any?) {
		defaults.set(object, forKey: key)
		defaults.synchronize()
	}

	func getObject(for key: String)->Any? {
		let object = defaults.object(forKey: key)
		return object
	}
}
