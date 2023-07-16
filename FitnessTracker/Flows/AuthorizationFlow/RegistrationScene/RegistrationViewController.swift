//
//  RegistrationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import UIKit
import PinLayout

#if DEBUG
import SwiftUI
#endif

protocol IRegistrationViewController: AnyObject {
	func render(viewModel: RegistrationModel.ViewModel)
}

class RegistrationViewController: UIViewController {

	// MARK: - Dependencies

	var interactor: IRegistrationInteractor?

	// MARK: - Private properties
	private lazy var textFieldName: UITextField = makeNameTextField()
	private lazy var textFieldEmail: UITextField = makeEmailTextField()
	private lazy var textFieldPass: UITextField = makePassTextField()
	private lazy var textFieldRepeatPass: UITextField = makePassRepeatTextField()

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
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	// MARK: - Actions

}

extension RegistrationViewController: IRegistrationViewController {
	func render(viewModel: RegistrationModel.ViewModel) {
	}
}

private extension RegistrationViewController {
	
	/// Метод layoutPinLayout выполняет размещения элементов интерфейса
	/// при помощи библиотеки Pinlayout.
	func layoutPinLayout() {
		view.addSubview(textFieldName)
		view.addSubview(textFieldEmail)
		view.addSubview(textFieldPass)
		view.addSubview(textFieldRepeatPass)

		textFieldName
			.pin
			.top(Sizes.topOffset)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		textFieldEmail
			.pin
			.below(of: textFieldName)
			.marginTop(Sizes.Padding.normal)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		textFieldPass
			.pin
			.below(of: textFieldEmail)
			.marginTop(Sizes.Padding.normal)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		textFieldRepeatPass
			.pin
			.below(of: textFieldPass)
			.marginTop(Sizes.Padding.normal)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)
	}

	func makeNameTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.name
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}

	func makeEmailTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.email
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}

	func makePassTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.password
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}
	
	func makePassRepeatTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.passwordRepeat
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}
}

#if DEBUG
struct Provider: PreviewProvider {
	static var previews: some View {
		Group {
			RegistrationViewController().preview()
		}
	}
}
#endif
