//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class TreatmentViewController: UIViewController {

	var output: TreatmentViewOutput?
	var moduleInput: TreatmentModuleInput?
	var moduleOutput: ExitDelegate?
	private var treatmentView: TreatmentView?

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func loadView() {
		let view = TreatmentView()
		self.view = view
		treatmentView = view
	}
}

//MARK: -TreatmentViewInput
extension TreatmentViewController: TreatmentViewInput {

	func setView() {
		view.backgroundColor = .white
		view.roundedCorner(with: 20)
	}
	
	//MARK: -StatusLabel
	func setTitleForStatusLabel(title: String) {
		guard let treatmentView = treatmentView, let statusLabel = treatmentView.statusLabel else { return }
		statusLabel.text = title
	}

	//MARK: -AmountOfMoneyLabel
	func setTitleAmountOfMoneyLabel(with amount: String) {
		guard let treatmentView = treatmentView, let amountOfMoneyLabel = treatmentView.amountOfMoneyLabel else { return }
		amountOfMoneyLabel.text = amount.moneyFormat()
	}

	//MARK: -OperationButton
	func setTargetOnOperationButton() {
		guard let treatmentView = treatmentView, let operationButton = treatmentView.operationButton else { return }
		operationButton.addTarget(self, action: #selector(operationButtonDidTapped), for: .touchUpInside)
	}
	
	@IBAction private func operationButtonDidTapped() {
		moduleOutput?.backToContacts()
	}

}
