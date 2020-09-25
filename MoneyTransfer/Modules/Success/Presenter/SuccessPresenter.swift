//
//  SuccessOperationPresenter.swift
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
	private var operation: Operations?

	init(view: SuccessOperationViewInput) {
		self.view = view
	}

	private func calculationOldBalance(balance: String, transaction: String)-> String {
		let oldBalance = (Double(balance) ?? 0) + (Double(transaction) ?? 0)
		return String(format: "%.2f", oldBalance)
	}

}

//MARK: -SuccessOperationViewOutput
extension SuccessOperationPresenter: SuccessOperationViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setView()
		view.setTargetOnOperationButton()
	}

}

//MARK: -SuccessOperationInteractorOutput
extension SuccessOperationPresenter: SuccessOperationInteractorOutput {

}

//MARK: -SuccessOperationModuleInput
extension SuccessOperationPresenter: SuccessOperationModuleInput {
	
	func configure(with balance: Balance) {
		guard let view = view else { return }
		view.setTitleAmountOfMoneyLable(with: balance.transactionMoney)
		view.setOldBalance(oldBalance: calculationOldBalance(balance: balance.balance, transaction: balance.transactionMoney))
		view.setCurrentBalance(balance: balance.balance)
	}
}