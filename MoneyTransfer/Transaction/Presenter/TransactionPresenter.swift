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

	init(view: TransactionViewInput) {
		self.view = view
	}
}
extension TransactionPresenter: TransactionViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setView()
		view.setupExitButton()
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
}

extension TransactionPresenter: TransactionInteractorOutput {

}

extension TransactionPresenter: TransactionModuleInput {
	
}
