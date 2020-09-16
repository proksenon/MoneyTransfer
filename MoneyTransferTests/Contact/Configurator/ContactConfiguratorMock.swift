//
//  ContactConfiguratorMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContactConfiguratorMock: ContactConfiguratorProtocol {

	var output: ContactViewOutputSpy

	init(output: ContactViewOutputSpy ) {
		self.output = output
	}

	func configure(with viewController: ContactViewController) {
		viewController.output = output
	}
}
