//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol TransactionViewDelegate {
//	func toggleTransaction(on vc: ChildsController?)
	func moveTransactionView(on y: CGFloat)
	func transactionMoney(amount: String?)
//	func backToContacts()
	func balance(balance: String?)
}

protocol TogleTransactionDelegate {
	func toggleTransaction(on vc: ChildsController?)
}

protocol ExitDelegate {
	func backToContacts()
}


enum ChildsController {
	case transactionViewController
	case treatmentViewController
	case successOperationViewController
}

class ContainerViewController: UIViewController {

	var output: ContainerViewOutput?
	var moduleInput: ContainerModuleInput?
	var moduleOutput: MainMouduleInput?
	var contactViewController: ContactViewController?
	var transactionViewController: TransactionViewController?
	var treatmentViewController: TreatmentViewController?
	var successOperationViewController: SuccessOperationViewController?
	var isShowingController: ChildsController = .transactionViewController
//	var isShow: Bool = false
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
        // Do any additional setup after loading the view.
    }
//	func configureContactViewController(with person: Person) {
//		let contactViewController = ContactViewController()
//		let configuratorContactModule = ContactConfigurator()
//		configuratorContactModule.configure(with: contactViewController)
//		contactViewController.moduleInput?.configure(with: person)
//		contactViewController.moduleOutput = self
//		contactViewController.view.frame = view.frame
//		add(contactViewController)
//		self.contactViewController = contactViewController
//	}
//
//	func configureTransactionViewController() {
//		let transactionViewController = TransactionViewController()
//		let	transactionConfigurator = TransactionConfigurator()
//		transactionConfigurator.configure(with: transactionViewController)
//		transactionViewController.view.frame.origin.y = self.view.frame.height
//		transactionViewController.moduleOutput = self
//		add(transactionViewController)
//		self.transactionViewController = transactionViewController
//	}
//
//	func configureTreatmentViewController(amountOfTransaction: String) {
//		let treatmentViewController = TreatmentViewController()
//		let treatmentConfigurator = TreatmentConfigurator()
//		treatmentConfigurator.configure(with: treatmentViewController)
//		treatmentViewController.moduleInput?.configure(amountOfTransaction: amountOfTransaction)
//		treatmentViewController.view.frame.origin.y = self.view.frame.height
//		add(treatmentViewController)
//		self.treatmentViewController = treatmentViewController
//	}

	func setPersonAtContactView(with person: Person) {
		guard let contactViewController = contactViewController else { return }
		contactViewController.moduleInput?.configure(with: person)
	}

	func setAmountAtTreatmentController(with amount: String) {
		guard let treatmentViewController = treatmentViewController else { return }
		treatmentViewController.moduleInput?.configure(amountOfTransaction: amount)
	}

	func setDataAtSuccesViewController(with balance: Balance) {
		guard let successOperationViewController = successOperationViewController else {return}
		successOperationViewController.moduleInput?.configure(with: balance)
	}
	

	func setupDimmView() {
		guard let contactViewController = contactViewController else { return }
		dimmView.frame = view.frame
		contactViewController.view.addSubview(dimmView)
	}

	func dimmViewIsHidden(_ isShow: Bool) {
		self.dimmView.alpha = isShow ? 0.6 : 0
	}

	func tapOutSite() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        dimmView.addGestureRecognizer(tapGesture)
	}

	@objc func tapGestureDone(){
		output?.togleTransaction(on: nil)
	}

	func transactionViewEndEditing(_ isEnd: Bool) {
		guard let transactionViewController = transactionViewController else { return }
		transactionViewController.view.endEditing(isEnd)
	}
	func showTransactionView(show: Bool, y: CGFloat? = nil, showVC: ChildsController) {
		var nextViewController: UIViewController
		switch showVC {
		case .transactionViewController:
			guard let transactionViewController = transactionViewController else { return }
			nextViewController = transactionViewController
		case .treatmentViewController:
			guard let treatmentViewController = treatmentViewController else { return }
			nextViewController = treatmentViewController
			output?.succesOperation()
		case .successOperationViewController:
			guard let successOperationViewController = successOperationViewController else { return }
			nextViewController = successOperationViewController
		}
		showTransaction(show: show, showViewController: nextViewController, y: y)
	}
	

	func showTreatmentView(show: Bool, y: CGFloat? = nil) {
		guard let treatmentViewController = treatmentViewController else { return }
		showTransaction(show: show, showViewController: treatmentViewController, y: y)
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
							self.transactionViewEndEditing(true)
							self.dimmViewIsHidden(show)
							showViewController.view.frame.origin.y = self.view.frame.height
			}) { (_) in
//				showViewController.remove()
			}
		}
	}

}

extension ContainerViewController: ContainerViewInput {

	
}

extension ContainerViewController: TogleTransactionDelegate {
	func toggleTransaction(on vc: ChildsController?) {
		output?.togleTransaction(on: vc)
	}
}

extension ContainerViewController: TransactionViewDelegate {

	func moveTransactionView(on y: CGFloat) {
		output?.moveTransaction(on: ViewSize(size: y))
	}

	func transactionMoney(amount: String?) {
		output?.transactionMoneyIs(amount: amount)
	}
	func balance(balance: String?) {
		output?.setBalance(balance: balance)
	}
}

extension ContainerViewController: ExitDelegate {
	func backToContacts() {
		moduleOutput?.statusTransaction(with: output?.getBalance())
		output?.dissmis()
	}
}
