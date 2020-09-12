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
		configureContactViewController(with: viewController)
		configureTransactionViewController(with: viewController)
		configureTreatmentViewController(with: viewController)
		configureSuccessViewController(with: viewController)
	}
	private func configureContactViewController(with viewController: ContainerViewController) {
		let contactViewController = ContactViewController()
		let configuratorContactModule = ContactConfigurator()
		configuratorContactModule.configure(with: contactViewController)
//		contactViewController.moduleInput?.configure(with: person)
		contactViewController.moduleOutput = viewController
		contactViewController.view.frame = viewController.view.frame
		viewController.add(contactViewController)
		viewController.contactViewController = contactViewController
	}
	private func configureTransactionViewController(with viewController: ContainerViewController) {
		let transactionViewController = TransactionViewController()
		let	transactionConfigurator = TransactionConfigurator()
		transactionConfigurator.configure(with: transactionViewController)
		transactionViewController.view.frame.origin.y = viewController.view.frame.height
		transactionViewController.moduleOutput = viewController
		viewController.add(transactionViewController)
		viewController.transactionViewController = transactionViewController
	}
	private func configureTreatmentViewController(with viewController: ContainerViewController) {
		let treatmentViewController = TreatmentViewController()
		let treatmentConfigurator = TreatmentConfigurator()
		treatmentConfigurator.configure(with: treatmentViewController)
		treatmentViewController.moduleOutput = viewController
//		treatmentViewController.moduleInput?.configure(amountOfTransaction: amountOfTransaction)
		treatmentViewController.view.frame.origin.y = viewController.view.frame.height
		viewController.add(treatmentViewController)
		viewController.treatmentViewController = treatmentViewController
	}
	private func configureSuccessViewController(with viewController: ContainerViewController) {
		let successViewController = SuccessOperationViewController()
		let successConfigurator = SuccessOperationConfigurator()
		successConfigurator.configure(with: successViewController)
		successViewController.moduleOutput = viewController
		successViewController.view.frame.origin.y = viewController.view.frame.height
		viewController.add(successViewController)
		viewController.successOperationViewController = successViewController

	}

}
