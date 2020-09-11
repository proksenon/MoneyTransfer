//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
class TreatmentPresenter {

	weak var view: TreatmentViewInput?
	var interactor: TreatmentInteractorInput?
	var router: TreatmentRouterInput?

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
	}
}

extension TreatmentPresenter: TreatmentInteractorOutput {

}

extension TreatmentPresenter: TreatmentModuleInput {

}
