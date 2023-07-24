//
//  ExercisesAssembler.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 24.07.2023.
//

import UIKit

final class ExercisesAssembler { // swiftlint:disable:this convenience_type
	static func assembly(coordinator: IMainCoordinator) -> UIViewController {

		let exercisesViewController = ExercisesViewController()
		let presenter = ExercisesPresenter(viewController: exercisesViewController)
		let worker = ExercisesWorker()
		let interactor = ExercisesInteractor(
			worker: worker,
			presenter: presenter,
			coordinator: coordinator
		)
		exercisesViewController.interactor = interactor

		return exercisesViewController
	}
}
