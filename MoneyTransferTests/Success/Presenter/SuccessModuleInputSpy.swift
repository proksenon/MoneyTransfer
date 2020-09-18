//
//  SuccessModuleInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class SuccessModuleInputSpy: SuccessOperationModuleInput {

	var didConfigure: Bool = false

	func configure(with balance: Balance) {
		didConfigure = true
	}
}
