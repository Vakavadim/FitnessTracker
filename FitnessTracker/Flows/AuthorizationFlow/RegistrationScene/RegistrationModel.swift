//
//  RegistrationModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import Foundation

enum RegistrationModel {
	struct Request {
		var login: Login
		var password: Password
	}

	struct Response {
		var error: Error
	}

	struct ViewModel {
		let errorMessage: String
	}
}
