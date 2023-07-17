//
//  AuthorizationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 10.06.2023.
//

import Foundation

protocol IAuthorizationWorker {
	func login(
		login: Email,
		password: Password,
		completion: @escaping (AuthorizationResult) -> Void
	)
}

enum AuthorizationResult {
	case success(User)
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
		login: Email,
		password: Password,
		completion: @escaping (AuthorizationResult) -> Void
	) {
		authManager.login(email: login, password: password) { [weak self] authResult in
			guard let self = self else { return }
			DispatchQueue.main.async {
				switch authResult {
				case .failure(let error):
					completion(AuthorizationResult.failure(error))
				case .success(let user):
					completion(AuthorizationResult.success(user))
				}
			}
		}
	}
}
