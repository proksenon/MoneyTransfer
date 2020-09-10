//
//  ContactsManager.swift
//  MoneyTransfer
//
//  Created by 18579132 on 31.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
import Contacts

class ContactsManager: ContactsManagerProtocol {

	var persons: [Person] = []

	func getContatcs(completion: @escaping ([Person])->Void) {
		let store = CNContactStore()
		store.requestAccess(for: .contacts) { granted, error in
			guard granted else { return }

			let keysToFetch = [CNContactGivenNameKey as NSString, CNContactFamilyNameKey as NSString, CNContactPhoneNumbersKey as NSString, CNContactImageDataKey as NSString]
			let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)

			guard let persons = self.dataProcessing(store: store, fetchRequest: fetchRequest) else { return }
			self.persons = persons
			completion(persons)
		}
	}

	private func getContactsFromStore(store: CNContactStore, fetchRequest: CNContactFetchRequest)->[CNContact]? {
		var contacts = [CNContact]()
		do {
			try store.enumerateContacts(with: fetchRequest) { contact, stop in
				contacts.append(contact)
			}
			return contacts
		} catch {
			print(error)
		}
		return nil
	}

	private func dataProcessing(store: CNContactStore, fetchRequest: CNContactFetchRequest)->[Person]? {
		guard let contacts = getContactsFromStore(store: store, fetchRequest: fetchRequest) else { return nil }
		var persons: [Person] = []
		for contact in contacts {
			var phone: String?
			if contact.phoneNumbers.count >= 1 {
				phone = (contact.phoneNumbers[0].value as CNPhoneNumber).stringValue
			}
			let fullName = contact.familyName + " " + contact.givenName
			let imageData = contact.imageData
			let person = Person(fullName: fullName, phoneNumber: phone, avatarData: imageData)
			persons.append(person)
		}
		persons.sort { (left, right) -> Bool in
			left.fullName ?? "" < right.fullName ?? ""
		}
		return persons
	}
}
