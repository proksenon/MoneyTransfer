//
//  TransactionConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class TransactionConfigurator: TransactionConfiguratorProtocol {

	func configure(with viewController: TransactionViewController){
		let presenter = TransactionPresenter(view: viewController)
		let interactor = TransactionInteractor(output: presenter)
		let router = TransactionRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router
	}

}
