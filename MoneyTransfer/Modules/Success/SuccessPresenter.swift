//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
class SuccessOperationPresenter {

	weak var view: SuccessOperationViewInput?
	var interactor: SuccessOperationInteractorInput?
	var router: SuccessOperationRouterInput?

	init(view: SuccessOperationViewInput) {
		self.view = view
	}

}

extension SuccessOperationPresenter: SuccessOperationViewOutput {

}

extension SuccessOperationPresenter: SuccessOperationInteractorOutput {

}

extension SuccessOperationPresenter: SuccessOperationModuleInput {

}
