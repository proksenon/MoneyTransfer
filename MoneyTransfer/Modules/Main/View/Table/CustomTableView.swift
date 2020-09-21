//
//  CustomTable.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class CustomTableView: UITableView {

	init() {
		super.init(frame: .zero, style: .insetGrouped)
		register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
		register(CardTableViewCell.self, forCellReuseIdentifier: "cell2")
		tableFooterView = UIView()
		separatorStyle = .singleLine
		backgroundColor = .white
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
