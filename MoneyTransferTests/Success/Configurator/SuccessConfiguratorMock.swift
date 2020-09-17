//
//  SuccessConfiguratorMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class SuccessConfiguratorMock: SuccessOperationConfiguratorProtocol {
	var output: SuccessViewOutputSpy

	init(output: SuccessViewOutputSpy) {
		self.output = output
	}
	func configure(with viewController: SuccessOperationViewController) {
		viewController.output = output
	}


}
