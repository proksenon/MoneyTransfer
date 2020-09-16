//
//  ContactSeviceMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContactsManagerMock: ContactsManagerProtocol {
	var persons = [Person]()

	func getContatcs(completion: @escaping ([Person]) -> Void) {
		completion(persons)
	}

}
