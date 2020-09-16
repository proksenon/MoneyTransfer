//
//  ContactViewOutputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContactViewOutputSpy: ContactViewOutput {

	var didconfigureView: Bool = false

	func configureView() {
		didconfigureView = true
	}
}
