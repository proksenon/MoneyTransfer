//
//  TransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Презентер модуля Transaction
final class TransactionPresenter {

	weak var view: TransactionViewInput?
	var interactor: TransactionInteractorInput?
	var router: TransactionRouterInput?
	/// Вид операции
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
		view.setTargetOnOperationButton()
		view.setupNotificationKeyboard()
		view.setupMoneyTextField()
	}

	func checkBalance() {
		guard let transaction = formatingTextField(), let view = view, let interactor = interactor, let operation = operation else { return }
		if let balanceString = interactor.getBalance() {
			guard let balanceD = Double(balanceString) else { return }
			if let transactionD = Double(transaction), transactionD > 0, balanceD >= transactionD || operation == .request {
				view.changeCornerColorMoneyTextField(result: .success)
				view.operationButtonIsEnabled(isEnabled: true)
			} else {
				view.changeCornerColorMoneyTextField(result: .failure)
				view.operationButtonIsEnabled(isEnabled: false)
			}
		}
	}

	func formatingTextField()->String? {
		guard let view = view, let text = view.textFieldText() else { return nil}
		let result = text.replacingOccurrences(of: ",", with: ".")
		return result
	}

	func getBalance() -> String? {
		interactor?.getBalance()
	}

	func setNewBalance() {
		guard let operation = operation else { return }
		if let oldBalance = getBalance(), let transaction = formatingTextField(), operation == .transaction {
			guard let oldBalance = Double(oldBalance), let transaction = Double(transaction) else {return}
			if oldBalance >= transaction {
				let newBalance = oldBalance - transaction
				interactor?.setBalance(balance: String(format: "%.2f", newBalance))
			}
		}
	}

	func checkTextFieldString(text: String?, string: String)-> Bool {
		let pattern = "((^[0]{1})([,]{1}[0-9]{0,2})?)|(([1-9][0-9]*)([,][0-9]{0,2})?)"
		var result = false
		if let text = text {
			result = isValidTextInput(text: text + string, pattern: pattern)
		} else {
			result = isValidTextInput(text: string, pattern: pattern)
		}
		return result
	}

	/// Проверка валидности текстфилда
	/// - Parameters:
	///   - text: Проверяемый текст
	///   - pattern: Условие
	/// - Returns: Валдидный или не валидный
	private func isValidTextInput(text: String, pattern: String) -> Bool {
		return text.matches(pattern)
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
			view.setTitleForOperationLabel(title: Labels.requestAmount)
			view.setTitleForOperationButton(title: Labels.request)
		default:
			view.setTitleForOperationLabel(title: Labels.transactionMoney)
			view.setTitleForOperationButton(title: Labels.send)
		}
		checkBalance()
	}
}
