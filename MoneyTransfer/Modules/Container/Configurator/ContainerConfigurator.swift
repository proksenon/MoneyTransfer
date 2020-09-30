//
//  TreatmentTransactionConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Конфигуратор модуля Container
final class ContainerConfigurator: ContainerConfiguratorProtocol {

	func configure(with viewController: ContainerViewController) {
		let presenter = ContainerPresenter(view: viewController)
		let interactor = ContainerInteractor(presenter: presenter)
		let router = ContainerRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router
		configureContactViewController(with: viewController, presenter: presenter)
		configureTransactionViewController(with: viewController, presenter: presenter)
		configureTreatmentViewController(with: viewController, presenter: presenter)
		configureSuccessViewController(with: viewController, presenter: presenter)
	}

	/// Конфигурирует модуль Contact
	/// - Parameters:
	///   - viewController: ContainerViewController
	///   - presenter: ContainerPresenter
	private func configureContactViewController(with viewController: ContainerViewController, presenter: ContainerPresenter) {
		let contactViewController = ContactViewController()
		let configuratorContactModule = ContactConfigurator()
		configuratorContactModule.configure(with: contactViewController)
		contactViewController.moduleOutput = presenter
		contactViewController.view.frame = viewController.view.frame
		viewController.add(contactViewController)
		presenter.contactViewController = contactViewController
	}

	/// Конфигурирует модуль Transaction
	/// - Parameters:
	///   - viewController: ContainerViewController
	///   - presenter: ContainerPresenter
	private func configureTransactionViewController(with viewController: ContainerViewController, presenter: ContainerPresenter) {
		let transactionViewController = TransactionViewController()
		let	transactionConfigurator = TransactionConfigurator()
		transactionConfigurator.configure(with: transactionViewController)
		transactionViewController.view.frame.origin.y = viewController.view.frame.height
		transactionViewController.moduleOutput = presenter
		viewController.add(transactionViewController)
		presenter.transactionViewController = transactionViewController
	}

	/// Конфигурирует модуль Treatment
	/// - Parameters:
	///   - viewController: ContainerViewController
	///   - presenter: ContainerPresenter
	private func configureTreatmentViewController(with viewController: ContainerViewController, presenter: ContainerPresenter) {
		let treatmentViewController = TreatmentViewController()
		let treatmentConfigurator = TreatmentConfigurator()
		treatmentConfigurator.configure(with: treatmentViewController)
		treatmentViewController.moduleOutput = presenter
		treatmentViewController.view.frame.origin.y = viewController.view.frame.height
		viewController.add(treatmentViewController)
		presenter.treatmentViewController = treatmentViewController
	}

	/// Конфигурирует модуль Success
	/// - Parameters:
	///   - viewController: ContainerViewController
	///   - presenter: ContainerPresenter
	private func configureSuccessViewController(with viewController: ContainerViewController, presenter: ContainerPresenter) {
		let successViewController = SuccessOperationViewController()
		let successConfigurator = SuccessOperationConfigurator()
		successConfigurator.configure(with: successViewController)
		successViewController.moduleOutput = presenter
		successViewController.view.frame.origin.y = viewController.view.frame.height
		viewController.add(successViewController)
		presenter.successOperationViewController = successViewController
	}

}
