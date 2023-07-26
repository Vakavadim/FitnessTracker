//
//  MainInteractor.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 20.07.2023.
//

import Foundation

/// Протокол для реализации авторизации
protocol IMainInteractor {
	/// Метод авторизации
	/// - Parameter request: получает модель запроса, содержащую логин и пароль
	func makeRequest(request: MainModel.Request)
}

class MainInteractor: IMainInteractor {

	// MARK: - Dependencies

	private var worker: IMainWorker
	private var presenter: IMainPresenter?
	private let coordinator: IMainCoordinator

	// MARK: - Lifecycle

	init(
		worker: IMainWorker,
		presenter: IMainPresenter,
		coordinator: IMainCoordinator
	) {
		self.worker = worker
		self.presenter = presenter
		self.coordinator = coordinator
	}

	// MARK: - Internal Methods

	func makeRequest(request: MainModel.Request) {
	}
}
