//
//  RegistrationModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import Foundation

enum RegistrationModel {
	enum Request {
		case createUser(RegistrationData)
	}
	
	struct RegistrationData {
		let name: Name
		let email: Email
		let password: Password
		let repPassword: Password
	}

	enum Response {
		case success(Email)
		case error(Error)
	}

	struct ViewModel {
		let message: String
	}
}
