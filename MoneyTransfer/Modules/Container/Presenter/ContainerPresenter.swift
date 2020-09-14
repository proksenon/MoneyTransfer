//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
class ContainerPresenter {

	weak var view: ContainerViewInput?
	var interactor: ContainerInteractorInput?
	var router: ContainerRouterInput?
	var person: Person? {
		didSet {
			guard let view = view, let person = person else { return }
			view.setPersonAtContactView(with: person)
		}
	}
	var isShow: Bool = false
	var isShowingController: ChildsController?
	var amountMoneyForTransaction: String?
	var balanceString: String?
	var balance: Balance?

	init(view: ContainerViewInput) {
		self.view = view
	}

}

extension ContainerPresenter: ContainerViewOutput {
	func configureView() {
		guard let view = view else { return }
//		view.setPersonAtContactView(with: person)
//		view.setupDimmView()
//		view.tapOutSite()
	}

	func togleTransaction(on vc: ChildsController?) {
		guard let view = view else { return }
		var viewController: ChildsController?
		if let vc = vc {
			viewController = vc
		}
		if let isShowingController = isShowingController {
			view.showTransactionView(show: false, y: nil, showVC: isShowingController)
			self.isShowingController = nil
			isShow = !isShow
		}
		guard let showVC = viewController else { return }
		isShowingController = showVC
		isShow = !isShow
		view.showTransactionView(show: isShow, y: nil, showVC: showVC)
	}


	func moveTransaction(on viewSize: ViewSize) {
		guard let view = view, let isShowingController = isShowingController else { return }
		view.showTransactionView(show: true, y: viewSize.size, showVC: isShowingController)
	}

	func transactionMoneyIs(amount: String?) {
		guard let view = view else { return }
		amountMoneyForTransaction = amount
		view.setAmountAtTreatmentController(with: amount ?? "so bad balance")
	}

	func dissmis() {
		router?.dissmis()
	}

	func succesOperation() {
		DispatchQueue.main.asyncAfter(deadline: .now()+5) {
			self.togleTransaction(on: .successOperationViewController)
		}
	}
	func setBalance(balance: String?) {
		guard let balance = balance else {return}
		self.balanceString = balance
		guard let amountMoneyForTransaction = amountMoneyForTransaction else {return}
		self.balance = Balance(balance: balance, transactionMoney: amountMoneyForTransaction)
		view?.setDataAtSuccesViewController(with: Balance(balance: balance, transactionMoney: amountMoneyForTransaction))
	}
	func getBalance() ->Balance? {
		return balance
	}
}

extension ContainerPresenter: ContainerInteractorOutput {

}

extension ContainerPresenter: ContainerModuleInput {
	func configure(with person: Person) {
//		self.person = person
		guard let view = view else { return }
		view.setPersonAtContactView(with: person)
		view.setupDimmView()
		view.tapOutSite()
	}
}
