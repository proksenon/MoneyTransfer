//
//  TransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class TransactionPresenter {

	weak var view: TransactionViewInput?
	var interactor: TransactionInteractorInput?
	var router: TransactionRouterInput?
	private var amountOfTransaction: String?
	private var operation: Operations?

	init(view: TransactionViewInput) {
		self.view = view
	}
}

//MARK: -TransactionViewOutput
extension TransactionPresenter: TransactionViewOutput {

	func configureView() {
		guard let view = view else { return }
		view.setView()
		view.setupNameOperationLabel()
		view.setupMoneyTextfield()
		view.setupOperationButton()
		view.setupNotificationKeyboard()
	}

	func checkBalance(transaction: String?) {
		guard let transaction = transaction, let view = view, let interactor = interactor, let operation = operation else { return }
		if let balanceString = interactor.getBalance() {
			guard let balanceInt = Int(balanceString) else { return }
			if let transactionInt = Int(transaction), balanceInt >= transactionInt || operation == .request {
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
		guard let operation = operation else { return }
		if let oldBalance = getBalance(), let transaction = transaction, operation == .transaction {
			guard let oldBalance = Int(oldBalance), let transaction = Int(transaction) else {return}
			let newBalance = oldBalance - transaction
			interactor?.setBalance(balance: String(newBalance))
		}
	}
}
//MARK: -TransactionInteractorOutput
extension TransactionPresenter: TransactionInteractorOutput {

}
//MARK: -TransactionModuleInput
extension TransactionPresenter: TransactionModuleInput {
	func configure(with operation: Operations) {
		self.operation = operation
		guard let view = view else {return}
		switch operation {
		case .request:
			view.setTitleForOperationLabel(title: "Запрос средств")
			view.setTitleForOperationButton(title: "Запросить")
		default:
			view.setTitleForOperationLabel(title: "Перевод средств")
			view.setTitleForOperationButton(title: "Перевести")
		}
	}

	
}
