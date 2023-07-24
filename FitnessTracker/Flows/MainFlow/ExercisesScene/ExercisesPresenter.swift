//
//  ExercisesPresenter.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 24.07.2023.
//

import Foundation

protocol IExercisesPresenter {
	func present(responce: ExercisesModel.Response)
}

class ExercisesPresenter: IExercisesPresenter {

	// MARK: - Dependencies

	private weak var viewController: IExercisesViewController?

	// MARK: - Lifecycle

	init(viewController: IExercisesViewController?) {
		self.viewController = viewController
	}

	// MARK: - Internal Methods

	func present(responce: ExercisesModel.Response) {
	}

	// MARK: - Private Methods

}
