//
//  RegistrationWorker.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import Foundation

protocol IRegistrationWorker {
	func register(
		name: Name,
		login: Email,
		password: Password,
		completion: @escaping (RegistrationResult) -> Void
	)
}

enum RegistrationResult {
	case success(User)
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
		name: Name,
		login: Email,
		password: Password,
		completion: @escaping (RegistrationResult) -> Void
	) {
		authManager.register(
			name: name,
			email: login,
			password: password
		) { result in
			switch result {
			case .failure(let error):
				completion(.failure(error))
			case .success(let user):
				completion(.success(user))
			}
		}
	}
}
