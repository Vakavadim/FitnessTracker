//
//  MainCoordinator.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 20.07.2023.
//

import Foundation

import UIKit

/// Протокол координатора экрана авторизации.
protocol IMainCoordinator: ICoordinator {
	func showMainScene()
}

/// Координатор экрана авторизации.
class MainCoordinator: IMainCoordinator {

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
		showMainScene()
	}
	
	/// Стартует сценарий сцены авторизации.
	func showMainScene() {
		let mainTabBarController = MainTabBarController(coordinator: self)
		navigationController.setViewControllers([mainTabBarController], animated: false)
	}
}
