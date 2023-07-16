//
//  RegistrationInteractor.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import Foundation

/// Протокол для реализации авторизации
protocol IRegistrationInteractor {
	/// Метод авторизации
	/// - Parameter request: получает модель запроса, содержащую логин и пароль
	func register(request: RegistrationModel.Request)
}

enum RegistrationError: Error {
	case unknownError
	case tokenHasNotBeenSave
}

class RegistrationInteractor: IRegistrationInteractor {

	// MARK: - Dependencies

	private var worker: IRegistrationWorker
	private var presenter: IRegistrationPresenter?
	private let coordinator: IAuthorizationCoordinator

	// MARK: - Lifecycle

	init(
		worker: IRegistrationWorker,
		presenter: IRegistrationPresenter,
		coordinator: IAuthorizationCoordinator
	) {
		self.worker = worker
		self.presenter = presenter
		self.coordinator = coordinator
	}

	// MARK: - Internal Methods

	func register(request: RegistrationModel.Request) {
	}
}
