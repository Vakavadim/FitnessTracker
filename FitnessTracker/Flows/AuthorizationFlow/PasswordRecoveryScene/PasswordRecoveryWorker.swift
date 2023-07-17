//
//  PasswordRecoveryWorker.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import Foundation

protocol IPasswordRecoveryWorker {
	func recoveryPassword(
		login: Email,
		password: Password
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
		login: Email,
		password: Password
	) { }
}
