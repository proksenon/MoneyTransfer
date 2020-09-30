//
//  SuccessOperationViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// ViewController модуля Success
final class SuccessOperationViewController: UIViewController {

	var output: SuccessOperationViewOutput?
	var moduleInput: SuccessOperationModuleInput?
	var moduleOutput: ExitDelegate?
	let successView: SuccessView = SuccessView()

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func loadView() {
		self.view = successView
	}

}

//MARK: -TreatmentInteractorInput
extension SuccessOperationViewController: SuccessOperationViewInput {

	func setView() {
		view.backgroundColor = .white
		view.decorate(with: CornerRadiusDecorator(cornerRadius: 20))
	}

	//MARK: -AmountOfMoneyLabel
	func setTitleAmountOfMoneyLable(with amount: String) {
		successView.amountOfMoneyLabel.text = amount.moneyFormat()
	}

	//MARK: -OperationButton
	func setTargetOnOperationButton() {
		successView.operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
	}

	@IBAction private func operationButtonDidTapped() {
		moduleOutput?.backToContacts()
	}

	//MARK: -BeforeTransactionBalanceLabel
	func setOldBalance(oldBalance: String) {
		successView.beforeTransactionBalanceLabel.text = oldBalance.moneyFormat()
	}

	//MARK: -CurrentBalanceLabel
	func setCurrentBalance(balance: String) {
		successView.currentBalanceLabel.text = balance.moneyFormat()
	}

}



