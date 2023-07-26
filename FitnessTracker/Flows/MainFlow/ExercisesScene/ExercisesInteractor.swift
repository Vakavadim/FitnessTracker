//
//  ExercisesInteractor.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 24.07.2023.
//

import Foundation

/// Протокол для реализации авторизации
protocol IExercisesInteractor {
	/// Метод авторизации
	/// - Parameter request: получает модель запроса, содержащую логин и пароль
	func makeRequest(request: ExercisesModel.Request)
}

class ExercisesInteractor: IExercisesInteractor {

	// MARK: - Dependencies

	private var worker: IExercisesWorker
	private var presenter: IExercisesPresenter?
	private let coordinator: IMainCoordinator

	// MARK: - Lifecycle

	init(
		worker: IExercisesWorker,
		presenter: IExercisesPresenter,
		coordinator: IMainCoordinator
	) {
		self.worker = worker
		self.presenter = presenter
		self.coordinator = coordinator
	}

	// MARK: - Internal Methods

	func makeRequest(request: ExercisesModel.Request) {
	}
}
