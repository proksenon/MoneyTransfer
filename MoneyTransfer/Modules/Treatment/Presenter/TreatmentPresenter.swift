//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
final class TreatmentPresenter {

	weak var view: TreatmentViewInput?
	var interactor: TreatmentInteractorInput?
	var router: TreatmentRouterInput?
	private var amountOfTransaction: String?

	init(view: TreatmentViewInput) {
		self.view = view
	}

}

extension TreatmentPresenter: TreatmentViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setView()
		view.setupTreatmentImageView()
		view.setupStatusLabel()
		view.setupAtributeTransactionLabel()
		view.setupAmountOfMoneyLabel()
		view.setupOperationButton()
		guard let amountOfTransaction = amountOfTransaction else { return }
		view.setTitleAmountOfMoneyLable(with: amountOfTransaction)
	}
}

extension TreatmentPresenter: TreatmentInteractorOutput {

}

extension TreatmentPresenter: TreatmentModuleInput {
	func configure(amountOfTransaction: String) {
		self.amountOfTransaction = amountOfTransaction
		guard let view = view else { return }
		view.setTitleAmountOfMoneyLable(with: amountOfTransaction)
	}

}
