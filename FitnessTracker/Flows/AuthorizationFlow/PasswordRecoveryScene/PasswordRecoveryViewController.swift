//
//  PasswordRecoveryViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import UIKit
import PinLayout

#if DEBUG
import SwiftUI
#endif

protocol IPasswordRecoveryViewController: AnyObject {
	func render(viewModel: PasswordRecoveryModel.ViewModel)
}

class PasswordRecoveryViewController: UIViewController {

	// MARK: - Dependencies

	var interactor: IPasswordRecoveryInteractor?

	// MARK: - Private properties
	private lazy var textFieldEmail: UITextField = makeEmailTextField()
	private lazy var textFieldPass: UITextField = makePasswordTextField()
	private lazy var textFieldRepeatPass: UITextField = makePasswordRepeatTextField()
	private lazy var changePassButtom: UIButton = makeChangePassButton()

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
		title = L10n.Authorization.resetPassword
	}

	// MARK: - Actions

}

extension PasswordRecoveryViewController: IPasswordRecoveryViewController {
	func render(viewModel: PasswordRecoveryModel.ViewModel) {
	}
}

private extension PasswordRecoveryViewController {
	
	/// Метод layoutPinLayout выполняет размещения элементов интерфейса
	/// при помощи библиотеки Pinlayout.
	func layoutPinLayout() {
		view.addSubview(textFieldEmail)
		view.addSubview(textFieldPass)
		view.addSubview(textFieldRepeatPass)
		view.addSubview(changePassButtom)
		
		textFieldEmail
			.pin
			.top(Sizes.topOffset)
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
		changePassButtom
			.pin
			.below(of: textFieldRepeatPass)
			.marginTop(Sizes.Padding.double)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)
	}

	func makeEmailTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.email
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}
	
	func makePasswordTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.resetPassword
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}
	
	func makePasswordRepeatTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.resetPasswordRepeat
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}

	func makeChangePassButton() -> UIButton {
		let button = FilledButton(title: L10n.Authorization.recoveryButtonTitle)
		button.configuration?.baseBackgroundColor = Theme.accentColor
		button.configuration?.baseForegroundColor = .white
		
		return button
	}
}

#if DEBUG
struct Provider: PreviewProvider {
	static var previews: some View {
		Group {
			PasswordRecoveryViewController().preview()
		}
	}
}
#endif
