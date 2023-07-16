//
//  RegistrationWorker.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import Foundation

protocol IRegistrationWorker {
	func register(
		login: Login,
		password: Password,
		completion: @escaping (RegistrationResult) -> Void
	)
}

enum RegistrationResult {
	case success(AuthToken)
	case failure(Error)
}

class RegistrationWorker: IRegistrationWorker {

	// MARK: - Dependencies

	let authManager: IAuthManager

	// MARK: - Lifecycle

	init(authManager: IAuthManager) {
		self.authManager = authManager
	}

	// MARK: - Internal Methods

	func register(
		login: Login,
		password: Password,
		completion: @escaping (RegistrationResult) -> Void
	) {
		authManager.register(login: login, password: password)
	}
}
