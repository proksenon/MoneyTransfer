//
//  ContainerViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 09.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol TransactionViewDelegate {
	func toggle()
	func moveTransactionView(on y: CGFloat)
}

class ContainerViewController: UIViewController {

	var contactViewController: UIViewController?
	var transactionViewController: UIViewController?
	var isShow: Bool = false
	private lazy var dimmView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.black.withAlphaComponent(1)
		view.alpha = 0
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

	func configureContactViewController(with person: Person) {
		let contactViewController = ContactViewController()
		let configuratorContactModule = ContactConfigurator()
		configuratorContactModule.configure(with: contactViewController)
		contactViewController.moduleInput?.configure(with: person)
		contactViewController.moduleOutput = self
		contactViewController.view.frame = view.frame
		add(contactViewController)
		self.contactViewController = contactViewController
		setupDimmView()
		tapOutSite()
	}

	func configureTransactionViewController() {
		let transactionViewController = TransactionViewController()
		let	transactionConfigurator = TransactionConfigurator()
		transactionConfigurator.configure(with: transactionViewController)
		transactionViewController.view.frame.origin.y = transactionViewController.view.frame.height
		transactionViewController.moduleOutput = self
		add(transactionViewController)
		self.transactionViewController = transactionViewController
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
		toggle()
	}

	func showTransactionView(show: Bool, y: CGFloat? = nil) {
		guard let transactionViewController = transactionViewController else { return }
		if show {
			UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
				self.dimmViewIsHidden(show)
				var originY = transactionViewController.view.frame.height/1.5
				if let y = y {
					originY -= y
				}
				transactionViewController.view.frame.origin.y = originY
			}, completion: nil)
		} else {
			UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
				transactionViewController.view.endEditing(true)
				self.dimmViewIsHidden(show)
				transactionViewController.view.frame.origin.y = transactionViewController.view.frame.height
			}) { (_) in
				transactionViewController.remove()
			}
		}
	}


}

extension ContainerViewController: TransactionViewDelegate {
	func toggle() {

		if !isShow {
			configureTransactionViewController()
		}
		isShow = !isShow
		showTransactionView(show: isShow)
	}

	func moveTransactionView(on y: CGFloat) {
		showTransactionView(show: true, y: y)
	}
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
