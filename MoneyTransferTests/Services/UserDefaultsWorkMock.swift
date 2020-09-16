//
//  UserDefaultsWorkMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class UserDefaultsWorkMock: UserDefaultsWorkProtocol {

	var object: Any?
	var didSet: Bool = false

	func setObject(for key: String, object: Any?) {
		didSet = true
	}

	func getObject(for key: String) -> Any? {
		return object
	}
}
