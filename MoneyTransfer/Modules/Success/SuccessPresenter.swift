//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
final class SuccessOperationPresenter {

	weak var view: SuccessOperationViewInput?
	var interactor: SuccessOperationInteractorInput?
	var router: SuccessOperationRouterInput?
	private var amountOfTransaction: String?
	private var currentBalance: String?
	private var operation: Operations?

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
