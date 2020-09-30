//
//  MainViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Controller of Main Module
final class MainViewController: UIViewController {

	var output: MainViewOutput?
	var moduleInput: MainMouduleInput?
	let mainView: MainView = MainView()
	/// Конфигуратор  модуля Main
	private var configurator: MainConfiguratorProtocol
	/// Кнопка скрола таблицы к 1 элементу
	private var scrollAtTopButton: UIBarButtonItem?

	init(configurator: MainConfiguratorProtocol = MainConfigurator()) {
		self.configurator = configurator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		configurator.configure(with: self)
		guard let output = output else { return }
		output.configureView()
	}

	override func loadView() {
		self.view = mainView
	}

	override func viewDidAppear(_ animated: Bool) {
		navigationTitleIsHidden(false)
	}

}
//MARK: -MainViewInput
extension MainViewController: MainViewInput {

	//MARK: -NavigationTitle
	func setBalanceTitleWith(balance: String) {
		self.title = Labels.currentBalance + " " + balance.moneyFormat()
	}

	func navigationTitleIsHidden(_ isHidden: Bool) {
		navigationController?.navigationBar.alpha = Alpha.fullView
	}

	func navigationBarIsHidden(_ isHidden: Bool) {
		UIView.animate(withDuration: Duration.medium, animations: {
			self.navigationController?.navigationBar.alpha = isHidden ? Alpha.withoutView : Alpha.fullView
		})
	}

	func navigationWithScrollAtTop() {
		navigationItem.leftBarButtonItem = scrollAtTopButton
	}

	//MARK: -TableView
	func setScrollAtTopButton() {
		scrollAtTopButton = UIBarButtonItem(image: UIImage(systemName: Images.back), style: .done, target: self, action: #selector(scrollAtTheTop))
	}

	@IBAction func scrollAtTheTop() {
		mainView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0) , at: .top, animated: true)
	}

	func tableViewReload() {
		DispatchQueue.main.async {
			self.mainView.tableView.reloadData()
		}
	}

	//MARK: -DimmView

	func dimmViewIsHidden(_ isShow: Bool) {
		mainView.dimmView.alpha = isShow ? Alpha.mediumView : Alpha.withoutView
	}
	func showDimmView(_ show: Bool) {
		UIView.animate(withDuration: Duration.medium) {
			self.dimmViewIsHidden(show)
		}
	}
	func tapOutSite() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
		mainView.dimmView.addGestureRecognizer(tapGesture)
	}

	/// Нажатие на dimmView
	@objc private func tapGestureDone(){
		guard let output = output else { return }
		output.dissmissStatusOperation()
	}
}


//MARK: -ExitDelegate
extension MainViewController: ExitDelegate {
	func backToContacts() {
		guard let output = output else { return }
		output.dissmissStatusOperation()
	}
}
