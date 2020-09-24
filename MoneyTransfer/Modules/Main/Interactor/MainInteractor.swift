//
//  MainInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Интерактор модуля Main
final class MainInteractor: MainInteractorInput {

	weak var output: MainInteractorOutput?
	private let contactsManager: ContactsManagerProtocol
	private let userDefaultsWork: UserDefaultsWorkProtocol

	init(presenter: MainInteractorOutput,
		 contactsManager: ContactsManagerProtocol = ContactsManager(),
		 userDefaultsWork: UserDefaultsWorkProtocol = UserDefaultsWork()) {
		self.output = presenter
		self.contactsManager = contactsManager
		self.userDefaultsWork = userDefaultsWork
	}

	func getContatcs(completion: @escaping ([Person])->Void) {
		contactsManager.getContatcs { (persons) in
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
