//
//  TransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

class TransactionPresenter {

	weak var view: TransactionViewInput?
	var interactor: TransactionInteractorInput?
	var router: TransactionRouterInput?
	var amountOfTransaction: String?

	init(view: TransactionViewInput) {
		self.view = view
	}
}
extension TransactionPresenter: TransactionViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setView()
//		view.setupExitButton()
		view.setupNameOperationLabel()
		view.setupMoneyTextfield()
		view.setupOperationButton()
		view.setupNotificationKeyboard()
	}

	func checkBalance(transaction: String?) {
		guard let transaction = transaction, let view = view, let interactor = interactor else { return }
		if let balanceString = interactor.getBalance() {
			guard let balanceInt = Int(balanceString) else { return }
			if let transactionInt = Int(transaction), balanceInt >= transactionInt {
				view.changeCornerColorMoneyTextField(result: .success)
				view.operationButtonIsEnabled(isEnabled: true)
			} else {
				view.changeCornerColorMoneyTextField(result: .failure)
				view.operationButtonIsEnabled(isEnabled: false)
			}
		}
	}
	func getBalance() -> String? {
		interactor?.getBalance()
	}
	func setNewBalance(transaction: String?) {
		if let oldBalance = getBalance(), let transaction = transaction {
			guard let oldBalance = Int(oldBalance), let transaction = Int(transaction) else {return}
			let newBalance = oldBalance - transaction
			interactor?.setBalance(balance: String(newBalance))
		}
	}
}

extension TransactionPresenter: TransactionInteractorOutput {

}

extension TransactionPresenter: TransactionModuleInput {
	
}
