//
//  UserDefaultsWorkProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол работы с UserDefaultsWork
protocol UserDefaultsWorkProtocol {
	/// Устанавливает данные в UserDefaults
	/// - Parameters:
	///   - key: Ключ, по которому устанавливается объект
	///   - object: Объект, который сохраняется по ключу
	func setObject(for key: String, object: Any?)
	/// Получает данные в UserDefaults
	/// - Parameter key: Ключ, по которому хранятся данные
	func getObject(for key: String)->Any?

}
