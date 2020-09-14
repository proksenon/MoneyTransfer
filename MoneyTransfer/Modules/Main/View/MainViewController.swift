//
//  MainViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit
import Contacts

class MainViewController: UIViewController {

	let configurator: MainConfiguratorProtocol = MainConfigurator()
	var output: MainViewOutput!
	var moduleInput: MainMouduleInput?
	var tableView: UITableView!
	var scrollAtTopButton: UIBarButtonItem!
	var balanceTitleLabel: UILabel?
	

	override func viewDidLoad() {
		configurator.configure(with: self)
		output.configureView()
	}
	override func viewDidAppear(_ animated: Bool) {
		navigationTitleIsHidden(false)
		tableViewReload()
	}

	func presentSettingsActionSheet() {
		let alert = UIAlertController(title: "Permission to Contacts", message: "This app needs access to contacts in order to ...", preferredStyle: .actionSheet)
		alert.addAction(UIAlertAction(title: "Go to Settings", style: .default) { _ in
			let url = URL(string: UIApplication.openSettingsURLString)!
			UIApplication.shared.open(url)
		})
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		present(alert, animated: true)
	}
}

extension MainViewController: MainViewInput {
	
	func tableViewReload() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}

	func setupBalanceTitle() {
		balanceTitleLabel = UILabel()
		guard let balanceTitleLabel = balanceTitleLabel, let navigationController = navigationController else { return }
		balanceTitleLabel.text = "Текущий баланс" + " " + "103 527,5 р"
		navigationController.navigationBar.insertSubview(balanceTitleLabel, at: 0)
		balanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([balanceTitleLabel.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor), balanceTitleLabel.centerXAnchor.constraint(equalTo: navigationController.navigationBar.centerXAnchor)])
		print("asd")
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
//		navigationItem.title = "Текущий баланс" + " " + "103 527,5 р"
	}

	func setScrollAtTopButton() {
		scrollAtTopButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(scrollAtTheTop))
	}

	@IBAction func scrollAtTheTop() {
		tableView.scrollToRow(at: IndexPath(row: 0, section: 0) , at: .top, animated: true)
	}

	func setTableView() {
		tableView = CustomTableView()
		view.addSubview(tableView)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
	}
}

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
			cell.balanceLabel.text = output.getBalance()
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
//		header.textLabel?.lineBreakMode = .byClipping

	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if indexPath.section == 1 {
			return UIScreen.main.bounds.height/11
		} else {
			return 300
		}
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
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


