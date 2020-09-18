//
//  ContainerConfiguratorMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContainerConfiguratorMock: ContainerConfiguratorProtocol {
	var output: ContainerViewOutputSpy

	init(output: ContainerViewOutputSpy ) {
		self.output = output
	}

	func configure(with viewController: ContainerViewController) {
		viewController.output = output
	}
}
