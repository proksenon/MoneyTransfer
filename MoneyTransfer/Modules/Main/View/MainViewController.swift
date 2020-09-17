//
//  MainViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit
import Contacts

final class MainViewController: UIViewController {

	var output: MainViewOutput!
	var moduleInput: MainMouduleInput?
	private var configurator: MainConfiguratorProtocol?
	private var tableView: UITableView?
	private var scrollAtTopButton: UIBarButtonItem?
	private var balanceTitleLabel: UILabel?
	private lazy var dimmView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.black.withAlphaComponent(1)
		view.alpha = 0
		return view
	}()

	init(configurator: MainConfiguratorProtocol = MainConfigurator()) {
		super.init(nibName: nil, bundle: nil)
		self.configurator = configurator
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		guard let configurator = configurator else { return }
		configurator.configure(with: self)
		output.configureView()
	}

	override func viewDidAppear(_ animated: Bool) {
		navigationTitleIsHidden(false)
	}

}
//MARK: -MainViewInput
extension MainViewController: MainViewInput {

	//MARK: -ТavigationTitle
	func setupBalanceTitle() {
		balanceTitleLabel = UILabel()
		guard let balanceTitleLabel = balanceTitleLabel, let navigationController = navigationController else { return }
		balanceTitleLabel.text = "Текущий баланс" + " " + "103 527,5 р"
		navigationController.navigationBar.insertSubview(balanceTitleLabel, at: 0)
		balanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([balanceTitleLabel.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor),
									 balanceTitleLabel.centerXAnchor.constraint(equalTo:
										navigationController.navigationBar.centerXAnchor)])
	}

	func setBalanceTitleWith(balance: String) {
		guard let balanceTitleLabel = balanceTitleLabel else { return }
		balanceTitleLabel.text = "Текущий баланс " + balance + " р"
	}

	func navigationTitleIsHidden(_ isHidden: Bool) {
		navigationController?.navigationBar.alpha = 1
		balanceTitleLabel?.isHidden = isHidden
	}

	func navigationBarIsHidden(_ isHidden: Bool) {
		UIView.animate(withDuration: 0.7, animations: {
			self.navigationController?.navigationBar.alpha = isHidden ? 0 : 1
		})
	}

	func navigationWithScrollAtTop() {
		navigationItem.leftBarButtonItem = scrollAtTopButton
	}
	//MARK: -TableView
	func setScrollAtTopButton() {
		scrollAtTopButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(scrollAtTheTop))
	}

	@IBAction func scrollAtTheTop() {
		guard let tableView = tableView else { return }
		tableView.scrollToRow(at: IndexPath(row: 0, section: 0) , at: .top, animated: true)
	}

	func setTableView() {
		let tableView = CustomTableView()
		view.addSubview(tableView)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		self.tableView = tableView
	}

	func tableViewReload() {
		guard let tableView = tableView else { return }
		DispatchQueue.main.async {
			tableView.reloadData()
		}

	}

	//MARK: -MainViewInput
	func setupDimmView() {
		dimmView.frame = view.frame
		view.addSubview(dimmView)
	}

	func dimmViewIsHidden(_ isShow: Bool) {
		dimmView.alpha = isShow ? 0.6 : 0
	}
	func showDimmView(_ show: Bool) {
		UIView.animate(withDuration: 0.7) {
			self.dimmViewIsHidden(show)
		}
	}
	func tapOutSite() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        dimmView.addGestureRecognizer(tapGesture)
	}

	@objc private func tapGestureDone(){
		output.dissmissStatusOperation()
	}
}
//MARK: -TableWork
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		} else {
			return output.countOfPersons()
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
			cell.configureCell(with: output.getPerson(with: indexPath))
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! CardTableViewCell
			cell.configureCell(with: output.getBalance())
			return cell
		}
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1 {
			return "Контакты"
		}
		return nil
	}

	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		view.tintColor = .white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
		header.textLabel?.font = header.textLabel?.font.withSize(20)
		header.sizeToFit()
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if indexPath.section == 1 {
			return UIScreen.main.bounds.height/11
		} else {
			return 300
		}
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		guard let tableView = tableView else { return }
		if tableView.contentOffset.y > 130 {
			output.cardInfromationLeft(false)
		} else {
			output.cardInfromationLeft(true)
		}
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.section != 0 {
			output.didChosePerson(indexPath: indexPath)
		}
	}

}
//MARK: -ExitDelegate
extension MainViewController: ExitDelegate {
	func backToContacts() {
		output.dissmissStatusOperation()
	}
}
