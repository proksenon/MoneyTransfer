//
//  TreatmentPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Презентер модуля treatment
final class TreatmentPresenter {

	weak var view: TreatmentViewInput?
	var interactor: TreatmentInteractorInput?
	var router: TreatmentRouterInput?
	/// Сумма транзакции
	private var amountOfTransaction: String = DefaultBalance.failBalance
	/// Операция: transaction или request
	private var operation: Operations?

	init(view: TreatmentViewInput) {
		self.view = view
	}

}

//MARK: -TreatmentViewOutput
extension TreatmentPresenter: TreatmentViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setView()
		view.setTargetOnOperationButton()
		view.setTitleAmountOfMoneyLabel(with: amountOfTransaction)
	}
}

//MARK: -TreatmentInteractorOutput
extension TreatmentPresenter: TreatmentInteractorOutput {

}

//MARK: -TreatmentModuleInput
extension TreatmentPresenter: TreatmentModuleInput {
	func configure(amountOfTransaction: String, operation: Operations) {
		self.amountOfTransaction = amountOfTransaction
		self.operation = operation
		guard let view = view else { return }
		view.setTitleAmountOfMoneyLabel(with: amountOfTransaction)
		switch operation {
		case .request:
			view.setTitleForStatusLabel(title: Labels.requestProcessing)
		default:
			view.setTitleForStatusLabel(title: Labels.transferProcessing)
		}
	}

}
