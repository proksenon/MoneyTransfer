//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

//MARK: - ChildControllersProtocols
/// Delegat of module Transaction
protocol TransactionViewDelegate {
	///  Поднимает или опускает контроллер
	func moveTransactionView(on y: ViewSize)
	///  Принимает сумму операции
	func transactionMoney(amount: String?)
	///  Принимает баланс
	func balance(balance: String?)
}

/// Delegat of operations
protocol OperationDelegate {
	///  Принимает нужную операцию
	func chooseOperation(operation: Operations)
}

/// Говорит, что надо переключить childController
protocol TogleTransactionDelegate {
	///  Переключает ChildControllers
	func toggleTransaction(on vc: ChildsController?)
}

/// Выходит с childController
protocol ExitDelegate {
	///  Выходит к конактам
	func backToContacts()
}

//MARK: -class ContainerPresenter
/// Презентер модуля Container
final class ContainerPresenter {

	weak var view: ContainerViewInput?
	var interactor: ContainerInteractorInput?
	var router: ContainerRouterInput?
	/// Контакт человека
	private var person: Person? {
		didSet {
			guard let person = person else { return }
			setPersonAtContactView(with: person)
		}
	}
	/// Показывается ли сейчас контроллер
	private var isShow: Bool = false
	/// Контроллер который должен показаться
	private var isShowingController: ChildsController?
	/// Сумма транзакции
	private var amountMoneyForTransaction: String?
	/// Баланс операции
	private var balance: BalanceOperation?
	/// Определяет нужно ли показать SuccessController
	private var statusShow: Bool = true
	/// Вид операции
	private var operation: Operations?
	var contactViewController: ContactViewController?
	var transactionViewController: TransactionViewController?
	var treatmentViewController: TreatmentViewController?
	var successOperationViewController: SuccessOperationViewController?

	init(view: ContainerViewInput) {
		self.view = view
	}

	//MARK: -SettingChildControlers
	private func setPersonAtContactView(with person: Person) {
		guard let contactViewController = contactViewController else { return }
		contactViewController.moduleInput?.configure(with: person)
	}

	private func setOperationAtTransactionView(operation: Operations) {
		guard let transactionViewController = transactionViewController else { return }
		transactionViewController.moduleInput?.configure(with: operation)
	}

	private func setAmountAtTreatmentController(with amount: String, operation: Operations) {
		guard let treatmentViewController = treatmentViewController else { return }
		treatmentViewController.moduleInput?.configure(amountOfTransaction: amount, operation: operation)
	}

	private func setDataAtSuccesViewController(with balance: BalanceOperation) {
		guard let successOperationViewController = successOperationViewController else {return}
		successOperationViewController.moduleInput?.configure(with: balance)
	}

	//MARK: -ShowTransactionViews
	private func showTransactionView(show: Bool, viewSize: ViewSize? = nil, showVC: ChildsController) {
		guard let view = view else { return }
		switch showVC {
		case .transactionViewController:
			guard let transactionViewController = transactionViewController else { return }
			view.showTransaction(show: show, view: transactionViewController.view, y: viewSize)
		case .treatmentViewController:
			guard let treatmentViewController = treatmentViewController else { return }
			if show {
				succesOperation()
			}
			view.showTransaction(show: show, view: treatmentViewController.view, y: viewSize)
		case .successOperationViewController:
			guard let successOperationViewController = successOperationViewController else { return }
			view.showTransaction(show: show, view: successOperationViewController.view, y: viewSize)
		}
	}

}

//MARK: -ContainerViewOutput
extension ContainerPresenter: ContainerViewOutput {
	func configureView() {
		view?.setBackButton()
	}

	func gestureDidUse() {
		switch isShowingController {
		case .successOperationViewController:
			guard let success = successOperationViewController else { return }
			view?.moveView(with: success.view)
		case .transactionViewController:
			guard let transaction = transactionViewController else { return }
			view?.moveView(with: transaction.view)
		case .treatmentViewController:
			guard let treatment = treatmentViewController else { return }
			view?.moveView(with: treatment.view)
		default:
			return
		}
	}

	//MARK: -TogleTransaction
	func togleTransaction(on vc: ChildsController?) {
		var viewController: ChildsController?
		if let vc = vc {
			if vc == .successOperationViewController, let operation = operation, operation == .request {
			} else {
				viewController = vc
			}
		}
		if let isShowingController = isShowingController {
			showTransactionView(show: false, viewSize: nil, showVC: isShowingController)
			self.isShowingController = nil
			isShow = !isShow
			statusShow = true
		}
		guard let showVC = viewController else { return }
		isShowingController = showVC
		isShow = !isShow
		showTransactionView(show: isShow, viewSize: nil, showVC: showVC)
	}

	private func succesOperation() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
			self.togleTransaction(on: .successOperationViewController)
			self.statusShow = false
		}
	}

	private func moveTransaction(on viewSize: ViewSize) {
		guard let isShowingController = isShowingController else { return }
		showTransactionView(show: true, viewSize: viewSize, showVC: isShowingController)
	}

	//MARK: -OperationWork
	private func transactionMoneyIs(amount: String?) {
		guard let operation = operation else { return }
		amountMoneyForTransaction = amount
		setAmountAtTreatmentController(with: amount ?? "so bad balance", operation: operation)
	}

	private func setBalance(balance: String?) {
		guard let balance = balance, let amountMoneyForTransaction = amountMoneyForTransaction else { return }
		let balanceWithTransaction = BalanceOperation(balance: balance, transactionMoney: amountMoneyForTransaction)
		setDataAtSuccesViewController(with: balanceWithTransaction)
		self.balance = balanceWithTransaction
	}

	func getBalance() ->BalanceOperation? {
		return balance
	}

	func showStatus() -> Bool {
		if let operation = operation, operation == .request {
			return false
		}
		return statusShow
	}

	private func setOperation(operation: Operations) {
		self.operation = operation
		setOperationAtTransactionView(operation: operation)
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
		setPersonAtContactView(with: person)
		view.setupDimmView()
		view.tapOutSite()
		guard let transaction = transactionViewController, let treatment = treatmentViewController, let success = successOperationViewController else { return }
		view.setGesture(views: [transaction.view, treatment.view, success.view])
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
