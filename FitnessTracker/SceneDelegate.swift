//
//  SceneDelegate.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 09.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var appCoordinator: IAppCoordinator?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)

		let navigationController = UINavigationController(rootViewController: UIViewController())
		appCoordinator = AppCoordinator(navigationController: navigationController)

		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		
		let context = AuthContext()
		
		let startEntity = StartEntity().selectStartFlow(context: context)

		appCoordinator?.start(startEntity)

		self.window = window
	}
}
