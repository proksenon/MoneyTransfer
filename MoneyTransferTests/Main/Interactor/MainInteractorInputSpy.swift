//
//  MainInteractorInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

@testable import MoneyTransfer

class MainInteractorInputSpy: MainInteractorInput {
	var didGetContacts: Bool = false
	var didGetBalance: Bool = false
	var didSetBalance: Bool = false
	var setBalance: String?
	var balance: String? {
		get {
			didGetBalance = true
			return setBalance
		}
		set {
			didSetBalance = true
		}
	}

	var persons: [Person]?

	func getContatcs(completion: @escaping ([Person]) -> Void) {
		didGetContacts = true
		guard let persons = persons else { return }
		completion(persons)
	}


}
