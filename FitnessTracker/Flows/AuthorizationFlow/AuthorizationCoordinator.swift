//
//  AuthorizationCoordinator.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 10.06.2023.
//

import UIKit

/// Протокол координатора экрана авторизации.
protocol IAuthorizationCoordinator: ICoordinator {
	func showAuthorizationScene()
	func showRegistrationScene()
	func showPasswordRecoveryScene()
}

/// Координатор экрана авторизации.
class AuthorizationCoordinator: IAuthorizationCoordinator {

	// MARK: - Dependencies

	var navigationController: UINavigationController

	// MARK: - Internal Properties

	weak var finishDelegate: ICoordinatorFinishDelegate?

	var childCoordinators: [ICoordinator] = [ICoordinator]()

	// MARK: - Lifecycle

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	// MARK: - Internal Methods

	/// Запуск и отображения сцены авторизации.
	func start(_ flow: Flow? = nil) {
		showAuthorizationScene()
	}
	
	/// Стартует сценарий сцены авторизации.
	func showAuthorizationScene() {
		let authorizationViewController = AuthorizationAssembler.assembly(coordinator: self)
		navigationController.setViewControllers([authorizationViewController], animated: false)
	}
	
	/// Стартует сценарий сцены регистрации.
	func showRegistrationScene() {
		let registrationViewController = RegistrationAssembler.assembly(coordinator: self)
		navigationController.pushViewController(registrationViewController, animated: true)
	}
	
	/// Стартует сценарий сцены востановления пароля.
	func showPasswordRecoveryScene() {
		let passwordRecoveryViewController = PasswordRecoveryAssembler.assembly(coordinator: self)
		navigationController.pushViewController(passwordRecoveryViewController, animated: true)
	}
}
