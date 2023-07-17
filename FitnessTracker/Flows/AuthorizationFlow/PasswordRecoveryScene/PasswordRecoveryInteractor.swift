//
//  PasswordRecoveryInteractor.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import Foundation

/// Протокол для реализации авторизации
protocol IPasswordRecoveryInteractor {
	/// Метод авторизации
	/// - Parameter request: получает модель запроса, содержащую логин и пароль
	func recoveryPassword(request: PasswordRecoveryModel.Request)
}

enum PasswordRecoveryError: Error {
	case unknownError
	case tokenHasNotBeenSave
}

class PasswordRecoveryInteractor: IPasswordRecoveryInteractor {

	// MARK: - Dependencies

	private var worker: IPasswordRecoveryWorker
	private var presenter: IPasswordRecoveryPresenter?
	private let coordinator: IAuthorizationCoordinator

	// MARK: - Lifecycle

	init(
		worker: IPasswordRecoveryWorker,
		presenter: IPasswordRecoveryPresenter,
		coordinator: IAuthorizationCoordinator
	) {
		self.worker = worker
		self.presenter = presenter
		self.coordinator = coordinator
	}

	// MARK: - Internal Methods

	func recoveryPassword(request: PasswordRecoveryModel.Request) {
	}
}
