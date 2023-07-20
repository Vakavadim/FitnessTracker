//
//  PasswordRecoveryWorker.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import Foundation

protocol IPasswordRecoveryWorker {
	func recoveryPassword(
		email: Email,
		completion: @escaping (Result<Email, Error>) -> Void
	)
}

class PasswordRecoveryWorker: IPasswordRecoveryWorker {

	// MARK: - Dependencies

	let authManager: IAuthManager

	// MARK: - Lifecycle

	init(authManager: IAuthManager) {
		self.authManager = authManager
	}

	// MARK: - Internal Methods

	func recoveryPassword(
		email: Email,
		completion: @escaping (Result<Email, Error>) -> Void
	) {
		authManager.resetPassword(email: email) { result in
			switch result {
			case .success(let email):
				completion(.success(email))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
