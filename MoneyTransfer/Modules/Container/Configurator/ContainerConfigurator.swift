//
//  TreatmentTransactionConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

class ContainerConfigurator {

	func configure(with viewController: ContainerViewController) {
		let presenter = ContainerPresenter(view: viewController)
		let interactor = ContainerInteractor(presenter: presenter)
		let router = ContainerRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router
	}

}
