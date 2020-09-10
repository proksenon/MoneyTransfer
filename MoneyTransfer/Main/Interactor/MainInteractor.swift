//
//  MainInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorInput {

	weak var output: MainInteractorOutput!
	let contactsManager: ContactsManagerProtocol
	let userDefaultsWork: UserDefaultsWorkProtocol
	var persons: [Person] = []

	init(presenter: MainInteractorOutput,
		 contactsManager: ContactsManagerProtocol = ContactsManager(),
		 userDefaultsWork: UserDefaultsWorkProtocol = UserDefaultsWork()) {
		self.output = presenter
		self.contactsManager = contactsManager
		self.userDefaultsWork = userDefaultsWork
	}

	func getContatcs(completion: @escaping ([Person])->Void) {
		contactsManager.getContatcs { [weak output] (persons) in
			completion(persons)
		}
	}

	func getBalance()-> String? {
		return userDefaultsWork.getObject(for: "balance") as? String
	}

	func setBalance(balance: String) {
		userDefaultsWork.setObject(for: "balance", object: balance)
	}

}
