//
//  MainPresenter.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 20.07.2023.
//

import Foundation

protocol IMainPresenter {
	func present(responce: MainModel.Response)
}

class MainPresenter: IMainPresenter {

	// MARK: - Dependencies

	private weak var viewController: IMainViewController?

	// MARK: - Lifecycle

	init(viewController: IMainViewController?) {
		self.viewController = viewController
	}

	// MARK: - Internal Methods

	func present(responce: MainModel.Response) {
	}

	// MARK: - Private Methods

}
