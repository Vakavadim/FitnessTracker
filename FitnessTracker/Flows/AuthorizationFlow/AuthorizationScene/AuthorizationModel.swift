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
	}

	struct LoginData {
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
