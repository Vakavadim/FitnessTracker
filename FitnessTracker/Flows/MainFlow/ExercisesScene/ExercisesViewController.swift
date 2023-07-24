//
//  ExercisesViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 24.07.2023.
//

import Foundation

import UIKit
import PinLayout

protocol IExercisesViewController: AnyObject {
	func render(viewModel: ExercisesModel.ViewModel)
}

class ExercisesViewController: UIViewController {

	// MARK: - Dependencies

	var interactor: IExercisesInteractor?

	// MARK: - Private properties

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layoutPinLayout()
	}

	// MARK: - Private methods

	private func setupUI() {
		view.backgroundColor = Theme.backgroundColor
	}

	// MARK: - Actions
	@objc
	func someAction() {
	}
}

extension ExercisesViewController: IExercisesViewController {
	func render(viewModel: ExercisesModel.ViewModel) {
	}
}

private extension ExercisesViewController {
	
	/// Метод layoutPinLayout выполняет размещения элементов интерфейса
	/// при помощи библиотеки Pinlayout.
	func layoutPinLayout() {
//		view.addSubview(textFieldEmail)
	}
}
