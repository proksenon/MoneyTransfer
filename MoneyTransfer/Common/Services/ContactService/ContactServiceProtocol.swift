//
//  ContactsManagerProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 31.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол менеджера Контактов
protocol ContactServiceProtocol: class {
	/// Получает контакты
	/// - Parameter completion: Список контактов в структуре Person
	func getContatcs(completion: @escaping ([Person])->Void)
}
