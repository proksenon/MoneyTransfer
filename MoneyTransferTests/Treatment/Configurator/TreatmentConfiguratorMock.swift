//
//  TreatmentConfiguratorMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class TreatmentConfiguratorMock: TreatmentConfiguratorProtocol {
	
	var output: TreatmentViewOutputSpy

	init(output: TreatmentViewOutputSpy) {
		self.output = output
	}
	func configure(with viewController: TreatmentViewController) {
		viewController.output = output
	}


}
