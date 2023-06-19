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
	func login(request: AuthorizationModel.Request)
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

	/// Метод логин производит авторизацию на сервере. В случае успеха полученный от сервера
	/// Токен сохраняется в память устройства и производится переход к главной сцене.
	/// В случае провала авторизации выполняется метод present(responce: )
	/// AuthorizationPresenter, в качестве responce направляется полученная ошибка для дальнейшей обработки.
	/// - Parameter request: структура AuthorizationModels.Request содержит данные для авторизации.
	func login(request: AuthorizationModel.Request) {
		worker.login(login: request.login, password: request.password) {_ in
		}
	}
}
