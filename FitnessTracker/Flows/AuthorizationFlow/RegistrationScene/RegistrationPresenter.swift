//
//  RegistrationPresenter.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import Foundation

protocol IRegistrationPresenter {
	func present(responce: RegistrationModel.Response)
}

class RegistrationPresenter: IRegistrationPresenter {

	// MARK: - Dependencies

	private weak var viewController: IRegistrationViewController?

	// MARK: - Lifecycle

	init(viewController: IRegistrationViewController?) {
		self.viewController = viewController
	}

	// MARK: - Internal Methods

	func present(responce: RegistrationModel.Response) {
		let viewModel = RegistrationModel.ViewModel(
			errorMessage: (handleError(error: responce.error))
		)
		viewController?.render(viewModel: viewModel)
	}

	// MARK: - Private Methods
// TODO: - реализовать подготовку сообщений об ошибке.

	/// Метод handleError подготавливает сообщение для отображения на экране
	/// в зависимости от типа полученной ошибки.
	/// - Parameter error: Ошибка полученная в процессе авторизации.
	/// - Returns: Релевантное сообщение из Localizable string.
	private func handleError(error: Error) -> String {
		return error.localizedDescription
	}
}
