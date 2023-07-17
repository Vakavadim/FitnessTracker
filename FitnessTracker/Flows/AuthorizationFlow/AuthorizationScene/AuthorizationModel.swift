//
//  AuthorizationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 10.06.2023.
//

import Foundation

enum AuthorizationModel {

	enum Request {
		case login(LoginData)
		case signUp
		case forgotPass
	}

	struct LoginData {
		var login: Email
		var password: Password
	}

	struct Response {
		var error: Error
	}

	struct ViewModel {
		let errorMessage: String
	}
}
