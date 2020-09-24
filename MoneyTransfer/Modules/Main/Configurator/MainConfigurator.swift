//
//  MainConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Конфигуратор модуля Main
final class MainConfigurator: MainConfiguratorProtocol {

	func configure(with viewController: MainViewController) {
		let presenter = MainPresenter(view: viewController)
		let interactor = MainInteractor(presenter: presenter)
		let router = MainRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router

		let delegate = MainTableDelegate(output: presenter)
		let dataSource = MainTableDataSource(output: presenter)
		presenter.mainTableDelegate = delegate
		presenter.mainTableDataSource = dataSource
		viewController.mainView.tableView.delegate = delegate
		viewController.mainView.tableView .dataSource = dataSource
	}
}
