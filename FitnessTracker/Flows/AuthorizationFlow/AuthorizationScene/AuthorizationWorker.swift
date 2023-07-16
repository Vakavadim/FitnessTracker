//
//  AuthorizationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 10.06.2023.
//

import Foundation

protocol IAuthorizationWorker {
	func login(
		login: Login,
		password: Password,
		completion: @escaping (AuthorizationResult) -> Void
	)
}

enum AuthorizationResult {
	case success
	case failure(Error)
}

class AuthorizationWorker: IAuthorizationWorker {

	// MARK: - Dependencies

	let authManager: IAuthManager

	// MARK: - Lifecycle

	init(authManager: IAuthManager) {
		self.authManager = authManager
	}

	// MARK: - Internal Methods

	func login(
		login: Login,
		password: Password,
		completion: @escaping (AuthorizationResult) -> Void
	) {
		authManager.login(login: login, password: password)
	}
}
