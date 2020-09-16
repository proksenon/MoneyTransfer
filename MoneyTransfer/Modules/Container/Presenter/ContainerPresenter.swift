//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
//MARK: - ChildControllersProtocols
protocol TransactionViewDelegate {
	///  Поднимает или опускает контроллер
	func moveTransactionView(on y: ViewSize)
	///  Принимает сумму операции
	func transactionMoney(amount: String?)
	///  Принимает баланс
	func balance(balance: String?)
}

protocol OperationDelegate {
	///  Принимает нужную операцию
	func chooseOperation(operation: Operations)
}

protocol TogleTransactionDelegate {
	///  Переключает ChildControllers
	func toggleTransaction(on vc: ChildsController?)
}

protocol ExitDelegate {
	///  Выходит к конактам
	func backToContacts()
}


final class ContainerPresenter {

	weak var view: ContainerViewInput?
	var interactor: ContainerInteractorInput?
	var router: ContainerRouterInput?
	private var person: Person? {
		didSet {
			guard let view = view, let person = person else { return }
			view.setPersonAtContactView(with: person)
		}
	}
	private var isShow: Bool = false
	private var isShowingController: ChildsController?
	private var amountMoneyForTransaction: String?
	private var balance: Balance?
	private var statusShow: Bool = true
	private var operation: Operations?

	init(view: ContainerViewInput) {
		self.view = view
	}

}
//MARK: -ContainerViewOutput
extension ContainerPresenter: ContainerViewOutput {
	func configureView() {}

	//MARK: -TogleTransaction
	func togleTransaction(on vc: ChildsController?) {
		guard let view = view else { return }
		var viewController: ChildsController?
		if let vc = vc {
			if vc == .successOperationViewController, let operation = operation, operation == .request {
			} else {
				viewController = vc
			}
		}
		if let isShowingController = isShowingController {
			view.showTransactionView(show: false, y: nil, showVC: isShowingController)
			self.isShowingController = nil
			isShow = !isShow
			statusShow = true
		}
		guard let showVC = viewController else { return }
		isShowingController = showVC
		isShow = !isShow
		view.showTransactionView(show: isShow, y: nil, showVC: showVC)
	}

	func succesOperation() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
			self.togleTransaction(on: .successOperationViewController)
			self.statusShow = false
		}
	}

	func moveTransaction(on viewSize: ViewSize) {
		guard let view = view, let isShowingController = isShowingController else { return }
		view.showTransactionView(show: true, y: viewSize.size, showVC: isShowingController)
	}
	//MARK: -OperationWork
	func transactionMoneyIs(amount: String?) {
		guard let view = view, let operation = operation else { return }
		amountMoneyForTransaction = amount
		view.setAmountAtTreatmentController(with: amount ?? "so bad balance", operation: operation)
	}

	func setBalance(balance: String?) {
		guard let balance = balance, let amountMoneyForTransaction = amountMoneyForTransaction else { return }
		let balanceWithTransaction = Balance(balance: balance, transactionMoney: amountMoneyForTransaction)
		view?.setDataAtSuccesViewController(with: balanceWithTransaction)
		self.balance = balanceWithTransaction
	}

	func getBalance() ->Balance? {
		return balance
	}

	func showStatus() -> Bool {
		if let operation = operation, operation == .request {
			return false
		}
		return statusShow
	}

	func setOperation(operation: Operations) {
		self.operation = operation
		view?.setOperationAtTransactionView(operation: operation)
	}

	//MARK: -Exit
	func dissmis() {
		router?.dissmis()
	}

}
//MARK: -ContainerInteractorOutput
extension ContainerPresenter: ContainerInteractorOutput {

}
//MARK: -ContainerModuleInput
extension ContainerPresenter: ContainerModuleInput {
	func configure(with person: Person) {
		guard let view = view else { return }
		view.setPersonAtContactView(with: person)
		view.setupDimmView()
		view.tapOutSite()
	}
}

//MARK: -TogleTransactionDelegate
extension ContainerPresenter: TogleTransactionDelegate {
	func toggleTransaction(on vc: ChildsController?) {
		togleTransaction(on: vc)
	}
}
//MARK: -TransactionViewDelegate
extension ContainerPresenter: TransactionViewDelegate {

	func moveTransactionView(on y: ViewSize) {
		moveTransaction(on: y)
	}

	func transactionMoney(amount: String?) {
		transactionMoneyIs(amount: amount)
	}

	func balance(balance: String?) {
		setBalance(balance: balance)
	}
}
//MARK: -ExitDelegate
extension ContainerPresenter: ExitDelegate {
	func backToContacts() {
		dissmis()
	}
}
//MARK: -OperationDelegate
extension ContainerPresenter: OperationDelegate {

	func chooseOperation(operation: Operations) {
		setOperation(operation: operation)
	}
}
