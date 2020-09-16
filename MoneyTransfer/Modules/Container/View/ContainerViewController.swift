//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class ContainerViewController: UIViewController {

	var output: ContainerViewOutput?
	var moduleInput: ContainerModuleInput?
	var moduleOutput: MainMouduleInput?
	var contactViewController: ContactViewController?
	var transactionViewController: TransactionViewController?
	var treatmentViewController: TreatmentViewController?
	var successOperationViewController: SuccessOperationViewController?
	private lazy var dimmView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.black.withAlphaComponent(1)
		view.alpha = 0
		return view
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func viewDidDisappear(_ animated: Bool) {
		moduleOutput?.statusTransaction(with: output?.getBalance(), show: output!.showStatus())
	}
}
//MARK: -ContainerViewInput
extension ContainerViewController: ContainerViewInput {

	//MARK: -SettingChildControlers
	func setPersonAtContactView(with person: Person) {
		guard let contactViewController = contactViewController else { return }
		contactViewController.moduleInput?.configure(with: person)
	}

	func setOperationAtTransactionView(operation: Operations) {
		guard let transactionViewController = transactionViewController else { return }
		transactionViewController.moduleInput?.configure(with: operation)
	}

	func setAmountAtTreatmentController(with amount: String, operation: Operations) {
		guard let treatmentViewController = treatmentViewController else { return }
		treatmentViewController.moduleInput?.configure(amountOfTransaction: amount, operation: operation)
	}

	func setDataAtSuccesViewController(with balance: Balance) {
		guard let successOperationViewController = successOperationViewController else {return}
		successOperationViewController.moduleInput?.configure(with: balance)
	}
	//MARK: -DimmView
	func setupDimmView() {
		guard let contactViewController = contactViewController else { return }
		dimmView.frame = view.frame
		contactViewController.view.addSubview(dimmView)
	}

	private func dimmViewIsHidden(_ isShow: Bool) {
		self.dimmView.alpha = isShow ? 0.6 : 0
	}

	func tapOutSite() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        dimmView.addGestureRecognizer(tapGesture)
	}

	@objc private func tapGestureDone(){
		output?.togleTransaction(on: nil)
	}
	//MARK: -ShowTransactionViews
	func showTransactionView(show: Bool, y: CGFloat? = nil, showVC: ChildsController) {
		var nextViewController: UIViewController
		switch showVC {
		case .transactionViewController:
			guard let transactionViewController = transactionViewController else { return }
			nextViewController = transactionViewController
		case .treatmentViewController:
			guard let treatmentViewController = treatmentViewController else { return }
			nextViewController = treatmentViewController
			if show {
				output?.succesOperation()
			}
		case .successOperationViewController:
			guard let successOperationViewController = successOperationViewController else { return }
			nextViewController = successOperationViewController
		}
		showTransaction(show: show, showViewController: nextViewController, y: y)
	}

	private func showTransaction(show: Bool, showViewController: UIViewController, y: CGFloat? = nil) {
		if show {
			UIView.animate(withDuration: 0.5,
						   delay: 0,
						   usingSpringWithDamping: 0.8,
						   initialSpringVelocity: 0,
						   options: .curveEaseInOut,
						   animations: {
							self.dimmViewIsHidden(show)
							var originY = self.view.frame.height - showViewController.view.frame.height + 20
							if let y = y {
								originY -= y
							}
							showViewController.view.frame.origin.y = originY
						},
						   completion: nil)
		} else {
			UIView.animate(withDuration: 0.5,
						   delay: 0,
						   usingSpringWithDamping: 0.8,
						   initialSpringVelocity: 0,
						   options: .curveEaseInOut,
						   animations: {
							showViewController.view.endEditing(true)
							self.dimmViewIsHidden(show)
							showViewController.view.frame.origin.y = self.view.frame.height
			}) { (_) in
//				showViewController.remove()
			}
		}
	}

	
}
