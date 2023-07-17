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
	func makeRequest(request: RegistrationModel.Request)
}

enum RegistrationError: Error {
	case passwordIsNotIdentical
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

	func makeRequest(request: RegistrationModel.Request) {
		switch request {
		case .createUser(let regData):
			guard regData.password.rawValue == regData.repPassword.rawValue else {
				presenter?.present(responce: .error(RegistrationError.passwordIsNotIdentical))
				return
			}
			worker.register(
				name: regData.name,
				login: regData.email,
				password: regData.password
			) { [weak self] result in
				guard let self = self else { return }
				
				DispatchQueue.main.async {
					switch result {
					case .success(let user):
						self.presenter?.present(responce: .success(user.email))
					case .failure(let error):
						self.presenter?.present(responce: .error(error))
					}
				}
			}
		}
	}
}
