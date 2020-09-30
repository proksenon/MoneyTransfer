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
	/// Сервис по работе с контактами
	private let contactsService: ContactServiceProtocol
	/// Сервис по работе с UserDefaults
	private let userDefaultsWork: UserDefaultsWorkProtocol
	var balance: String? {
		get {
			return userDefaultsWork.getObject(for: "balance") as? String
		}
		set {
			userDefaultsWork.setObject(for: "balance", object: newValue)
		}
	}

	init(presenter: MainInteractorOutput,
		 contactsManager: ContactServiceProtocol = ContactService(),
		 userDefaultsWork: UserDefaultsWorkProtocol = UserDefaultsWork()) {
		self.output = presenter
		self.contactsService = contactsManager
		self.userDefaultsWork = userDefaultsWork
	}

	func getContatcs(completion: @escaping ([Person])->Void) {
		contactsService.getContatcs { (persons) in
			completion(persons)
		}
	}

}
