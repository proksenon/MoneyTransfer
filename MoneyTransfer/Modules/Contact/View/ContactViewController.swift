//
//  ContactViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// ViewController модуля Contact
final class ContactViewController: UIViewController {

	typealias TogleView = TogleTransactionDelegate & OperationDelegate
	var output: ContactViewOutput?
	var moduleInput: ContactModuleInput?
	var moduleOutput: TogleView?
	let contactView: ContactView = ContactView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }
	
	override func loadView() {
		self.view = contactView
	}

}
//MARK: -ContactViewInput
extension ContactViewController: ContactViewInput {

	func setViewColor() {
		view.backgroundColor = UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
	}

	//MARK: -AvatarImageView
	func setDataToAvatar(with data: Data?) {
		guard let data = data else { return }

		contactView.avatarImageView.image = UIImage(data: data)
	}
	//MARK: -FullNameLabel
	func setFullName(with name: String) {
		contactView.fullNameLabel.text = name
	}
	
	//MARK: -PhoneNumberLabel
	func setPhoneNumber(with phone: String) {
		contactView.phoneNumberLabel.text = phone
	}

	//MARK: -RequestMoneyButton
	func setTargetRequestMoneyButton() {
		contactView.requestMoneyButton.addTarget(self, action: #selector(requestMoney), for: .touchUpInside)
	}
	
	@IBAction private func requestMoney() {
		moduleOutput?.chooseOperation(operation: .request)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
	}

	//MARK: -SendMoneyButton
	func setTargetOnSendMoneyButton() {
		contactView.sendMoneyButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
	}
	
	@IBAction private func sendMoney() {
		moduleOutput?.chooseOperation(operation: .transaction)
		moduleOutput?.toggleTransaction(on: .transactionViewController)
	}
}
