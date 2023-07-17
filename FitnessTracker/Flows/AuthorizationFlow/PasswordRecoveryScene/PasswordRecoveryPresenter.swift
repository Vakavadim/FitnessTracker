//
//  PasswordRecoveryPresenter.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import Foundation

protocol IPasswordRecoveryPresenter {
	func present(responce: PasswordRecoveryModel.Response)
}

class PasswordRecoveryPresenter: IPasswordRecoveryPresenter {

	// MARK: - Dependencies

	private weak var viewController: IPasswordRecoveryViewController?

	// MARK: - Lifecycle

	init(viewController: IPasswordRecoveryViewController?) {
		self.viewController = viewController
	}

	// MARK: - Internal Methods

	func present(responce: PasswordRecoveryModel.Response) {
		let viewModel = PasswordRecoveryModel.ViewModel(
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
