//
//  AuthorizationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 10.06.2023.
//

import Foundation

/// Протокол для реализации авторизации
protocol IAuthorizationInteractor {
	/// Метод авторизации
	/// - Parameter request: получает модель запроса, содержащую логин и пароль
	func makeRequest(request: AuthorizationModel.Request)
}

enum AuthorizationError: Error {
	case unknownError
	case tokenHasNotBeenSave
}

class AuthorizationInteractor: IAuthorizationInteractor {
	
	// MARK: - Dependencies

	private var worker: IAuthorizationWorker
	private var presenter: IAuthorizationPresenter?
	private let coordinator: IAuthorizationCoordinator

	// MARK: - Lifecycle

	init(
		worker: IAuthorizationWorker,
		presenter: IAuthorizationPresenter,
		coordinator: IAuthorizationCoordinator
	) {
		self.worker = worker
		self.presenter = presenter
		self.coordinator = coordinator
	}

	// MARK: - Internal Methods

	/// Метод makeRequest
	/// - Parameter request: структура AuthorizationModels.Request содержит данные для авторизации.
	func makeRequest(request: AuthorizationModel.Request) {
		switch request {
		case .login(_):
			print("login")
		case .signUp:
			coordinator.showRegistrationScene()
		}
	}
}
