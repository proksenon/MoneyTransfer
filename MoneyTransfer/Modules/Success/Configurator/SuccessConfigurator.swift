//
//  SuccessOperationConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class SuccessOperationConfigurator {

	func configure(with viewController: SuccessOperationViewController) {
		let presenter = SuccessOperationPresenter(view: viewController)
		let interactor = SuccessOperationInteractor(presenter: presenter)
		let router = SuccessOperationRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router
	}

}
