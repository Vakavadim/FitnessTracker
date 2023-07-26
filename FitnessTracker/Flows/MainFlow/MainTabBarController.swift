//
//  MainTabBarController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 22.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	// MARK: - Dependencies
	private var coordinator: IMainCoordinator

	// MARK: - Private properties
	private lazy var mainVC: UIViewController = MainAssembler.assembly(coordinator: self.coordinator)
	private lazy var exercisesVC: UIViewController = ExercisesAssembler.assembly(coordinator: self.coordinator)
	
	// MARK: - Lifecycle
	init(coordinator: IMainCoordinator) {
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.tintColor = Theme.accentColor
		
		setTabs(
			viewController: mainVC,
			image: UIImage(systemName: "list.bullet.circle"),
			title: "Workout"
		)
		setTabs(
			viewController: exercisesVC,
			image: UIImage(systemName: "list.bullet.circle"),
			title: "Exercises"
		)
		viewControllers = [mainVC, exercisesVC]
	}
	
	private func setTabs(viewController: UIViewController, image: UIImage?, title: String) {
		guard let image = image else { return }
		viewController.tabBarItem.image = image
		viewController.tabBarItem.title = title
	}
}
