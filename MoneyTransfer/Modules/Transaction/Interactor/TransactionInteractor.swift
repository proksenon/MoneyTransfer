//
//  TransactionInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class TransactionInteractor {

	weak var output: TransactionInteractorOutput?
	private let userDefaultsWork: UserDefaultsWorkProtocol

	init(output: TransactionInteractorOutput, userDefaultsWork: UserDefaultsWorkProtocol = UserDefaultsWork()) {
		self.output = output
		self.userDefaultsWork = userDefaultsWork
	}

}

//MARK: -TransactionInteractorInput
extension TransactionInteractor: TransactionInteractorInput {
	func getBalance()-> String? {
		return userDefaultsWork.getObject(for: "balance") as? String
	}

	func setBalance(balance: String) {
		userDefaultsWork.setObject(for: "balance", object: balance)
	}
}
