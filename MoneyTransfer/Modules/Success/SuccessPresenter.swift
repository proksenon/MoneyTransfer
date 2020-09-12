//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
class SuccessOperationPresenter {

	weak var view: SuccessOperationViewInput?
	var interactor: SuccessOperationInteractorInput?
	var router: SuccessOperationRouterInput?
	var amountOfTransaction: String?
	var currentBalance: String?

	init(view: SuccessOperationViewInput) {
		self.view = view
	}

	private func calculationOldBalance(balance: String, transaction: String)-> String {
		let oldBalance = (Int(balance) ?? 0) + (Int(transaction) ?? 0)
		return String(oldBalance)
	}

}

extension SuccessOperationPresenter: SuccessOperationViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setView()
		view.setupTreatmentImageView()
		view.setupStatusLabel()
		view.setupAtributeTransactionLabel()
		view.setupAmountOfMoneyLabel()
		view.setupOperationButton()
		view.setupChangeBalanceLabel()
		view.setupBeforeTransactionBalanceLabel()
		view.setupCurrentBalanceLabel()
//		guard let amountOfTransaction = amountOfTransaction else { return }
//		view.setTitleAmountOfMoneyLable(with: amountOfTransaction)
	}

}

extension SuccessOperationPresenter: SuccessOperationInteractorOutput {

}

extension SuccessOperationPresenter: SuccessOperationModuleInput {
	func configure(with balance: Balance) {
		self.currentBalance = balance.balance
		self.amountOfTransaction = balance.transactionMoney
		guard let view = view else { return }
		view.setTitleAmountOfMoneyLable(with: balance.transactionMoney)
		view.setOldBalance(oldBalance: calculationOldBalance(balance: balance.balance, transaction: balance.transactionMoney))
		view.setCurrentBalance(balance: balance.balance)
	}
}
