//
//  MainOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainViewOutput: class {
	func configureView()
	func countOfPersons()->Int
	func getPerson(with indexPath: IndexPath)-> Person
	func cardInfromationLeft(_ isLeft: Bool)
	func didChosePerson(indexPath: IndexPath)
	func getBalance()-> String 
}
