//
//  MainView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class MainView: UIView {

	var tableView: UITableView = CustomTableView()
	lazy var dimmView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.black.withAlphaComponent(1)
		view.alpha = 0
		return view
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setTableView()
		setupDimmView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setTableView() {
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
	}

	private func setupDimmView() {
		addSubview(dimmView)
		dimmView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([dimmView.topAnchor.constraint(equalTo: self.topAnchor),
									 dimmView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
									 dimmView.leftAnchor.constraint(equalTo: self.leftAnchor),
									 dimmView.rightAnchor.constraint(equalTo: self.rightAnchor)])
	}

}
