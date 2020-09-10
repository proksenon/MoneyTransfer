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

}

extension TreatmentPresenter: TreatmentInteractorOutput {

}

extension TreatmentPresenter: TreatmentModuleInput {

}
