//
//  CustomTable.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

	init() {
		super.init(frame: .zero, style: .plain)
		register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
		register(CardTableViewCell.self, forCellReuseIdentifier: "cell2")
		tableFooterView = UIView()
		separatorStyle = .singleLine
//		contentInsetAdjustmentBehavior = .never
		backgroundColor = .white
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	/*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
