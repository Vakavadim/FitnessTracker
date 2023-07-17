//
//  PasswordRecoveryAssembler.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import UIKit

final class PasswordRecoveryAssembler { // swiftlint:disable:this convenience_type
	static func assembly(coordinator: IAuthorizationCoordinator) -> UIViewController {

		let passwordRecoveryViewController = PasswordRecoveryViewController()
		let presenter = PasswordRecoveryPresenter(viewController: passwordRecoveryViewController)
		let authManager = AuthManager()
		let worker = PasswordRecoveryWorker(authManager: authManager)
		let interactor = PasswordRecoveryInteractor(
			worker: worker,
			presenter: presenter,
			coordinator: coordinator
		)
		passwordRecoveryViewController.interactor = interactor

		return passwordRecoveryViewController
	}
}
