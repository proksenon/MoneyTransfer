//
//  ContactViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class ContactViewController: UIViewController {

	typealias TogleView = TogleTransactionDelegate & OperationDelegate
	var output: ContactViewOutput?
	var moduleInput: ContactModuleInput?
	var moduleOutput: TogleView?
	private var contactView: ContactView?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }
	
	override func loadView() {
		let view = ContactView()
		self.view = view
		contactView = view
	}

}
//MARK: -ContactViewInput
extension ContactViewController: ContactViewInput {

	func setViewColor() {
		view.backgroundColor = UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
	}

	//MARK: -AvatarImageView
	func setDataToAvatar(with data: Data?) {
		guard let contactView = contactView,
			  let avatarImageView = contactView.avatarImageView,
			  let data = data
		else { return }

		avatarImageView.image = UIImage(data: data)
	}
	//MARK: -FullNameLabel
	func setFullName(with name: String) {
		contactView?.fullNameLabel?.text = name
	}
	
	//MARK: -PhoneNumberLabel
	func setPhoneNumber(with phone: String) {
		guard let contactView = contactView, let phoneNumberLabel = contactView.phoneNumberLabel else { return }

		phoneNumberLabel.text = phone
	}

	//MARK: -RequestMoneyButton
	func setTargetRequestMoneyButton() {
		guard let contactView = contactView, let requestMoneyButton = contactView.requestMoneyButton else { return }

		requestMoneyButton.addTarget(self, action: #selector(requestMoney), for: .touchUpInside)
	}
	
	@IBAction private func requestMoney() {
		moduleOutput?.chooseOperation(operation: .request)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
	}

	//MARK: -SendMoneyButton
	func setTargetOnSendMoneyButton() {
		guard let contactView = contactView, let sendMoneyButton = contactView.sendMoneyButton else { return }
		sendMoneyButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
	}
	
	@IBAction private func sendMoney() {
		moduleOutput?.chooseOperation(operation: .transaction)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
	}
}
