//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class SuccessOperationViewController: UIViewController {

	var output: SuccessOperationViewOutput?
	var moduleInput: SuccessOperationModuleInput?
	var moduleOutput: ExitDelegate?
	private var successView: SuccessView?

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func loadView() {
		let view = SuccessView()
		self.view = view
		successView = view
	}

}

//MARK: -TreatmentInteractorInput
extension SuccessOperationViewController: SuccessOperationViewInput {

	func setView() {
		view.backgroundColor = .white
		view.roundedCorner(with: 20)
	}

	//MARK: -AmountOfMoneyLabel
	func setTitleAmountOfMoneyLable(with amount: String) {
		guard let successView = successView, let amountOfMoneyLabel = successView.amountOfMoneyLabel else { return }
		amountOfMoneyLabel.text = amount.moneyFormat()
	}

	//MARK: -OperationButton
	func setTargetOnOperationButton() {
		guard let successView = successView, let operationButton = successView.operationButton else { return }
		operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
	}

	@IBAction private func operationButtonDidTapped() {
		moduleOutput?.backToContacts()
	}

	//MARK: -BeforeTransactionBalanceLabel
	func setOldBalance(oldBalance: String) {
		guard let successView = successView, let beforeTransactionBalanceLabel = successView.beforeTransactionBalanceLabel else { return }
		beforeTransactionBalanceLabel.text = oldBalance.moneyFormat()
	}

	//MARK: -CurrentBalanceLabel
	func setCurrentBalance(balance: String) {
		guard let successView = successView, let currentBalanceLabel = successView.currentBalanceLabel else { return }
		currentBalanceLabel.text = balance.moneyFormat()
	}

}



