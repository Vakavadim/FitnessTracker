//
//  RegistrationAssembler.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import UIKit

final class RegistrationAssembler { // swiftlint:disable:this convenience_type
	static func assembly(coordinator: IAuthorizationCoordinator) -> UIViewController {

		let registrationViewController = RegistrationViewController()
		let presenter = RegistrationPresenter(viewController: registrationViewController)
		let authManager = AuthManager()
		let worker = RegistrationWorker(authManager: authManager)
		let interactor = RegistrationInteractor(
			worker: worker,
			presenter: presenter,
			coordinator: coordinator
		)
		registrationViewController.interactor = interactor

		return registrationViewController
	}
}
