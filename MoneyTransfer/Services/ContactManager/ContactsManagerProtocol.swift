//
//  ContactsManagerProtocol.swift
//  MoneyTransfer
//
//  Created by 18579132 on 31.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol ContactsManagerProtocol: class {
	var persons: [Person] { get }

	func getContatcs(completion: @escaping ([Person])->Void)
}
