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
		switch responce {
		case .success(let email):
			let viewModel = RegistrationModel.ViewModel(
				message: "We have sent you an email adress to approve \(email.rawValue)"
			)
			viewController?.render(viewModel: viewModel)
		case .error(let error):
			let viewModel = RegistrationModel.ViewModel(
				message: (handleError(error: error))
			)
			viewController?.render(viewModel: viewModel)
		}
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
