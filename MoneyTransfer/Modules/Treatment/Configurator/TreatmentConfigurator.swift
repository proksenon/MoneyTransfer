//
//  TreatmentConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Конфигуратор моделя Treatment
final class TreatmentConfigurator {

	func configure(with viewController: TreatmentViewController) {
		let presenter = TreatmentPresenter(view: viewController)
		let interactor = TreatmentInteractor(presenter: presenter)
		let router = TreatmentRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router
	}

}
