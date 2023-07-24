//
//  MainAssembler.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 20.07.2023.
//

import UIKit

final class MainAssembler { // swiftlint:disable:this convenience_type
	static func assembly(coordinator: IMainCoordinator) -> UIViewController {

		let mainViewController = MainViewController()
		let presenter = MainPresenter(viewController: mainViewController)
		let worker = MainWorker()
		let interactor = MainInteractor(
			worker: worker,
			presenter: presenter,
			coordinator: coordinator
		)
		mainViewController.interactor = interactor

		return mainViewController
	}
}
