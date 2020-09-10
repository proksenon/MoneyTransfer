//
//  MainInteractorInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainInteractorInput: class {
	func getContatcs(completion: @escaping ([Person])->Void)
	func getBalance()-> String?
	func setBalance(balance: String)
}
