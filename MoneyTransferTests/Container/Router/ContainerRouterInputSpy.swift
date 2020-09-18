//
//  ContainerInteractorInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContainerRouterInputSpy: ContainerRouterInput {

	var didDissmis: Bool = false

	func dissmis() {
		didDissmis = true
	}


}
