//
//  RegistrationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 21.06.2023.
//

import UIKit
import PinLayout

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
	private lazy var signUpButtom: UIButton = makeSignUpButton()
	
	private var nameText: String {
		get {
			textFieldName.text ?? ""
		}
		set {
			textFieldName.text = newValue
		}
	}
	private var emailText: String {
		get {
			textFieldEmail.text ?? ""
		}
		set {
			textFieldEmail.text = newValue
		}
	}
	private var passText: String {
		get {
			textFieldPass.text ?? ""
		}
		set {
			textFieldPass.text = newValue
		}
	}
	private var repPassText: String {
		get {
			textFieldRepeatPass.text ?? ""
		}
		set {
			textFieldRepeatPass.text = newValue
		}
	}

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
		title = L10n.Authorization.registration
	}

	// MARK: - Actions
	@objc
	func makeSignUp() {
		let registrtionData = RegistrationModel.RegistrationData(
			name: Name(nameText),
			email: Email(emailText),
			password: Password(passText),
			repPassword: Password(repPassText)
		)
		interactor?.makeRequest(request: .createUser(registrtionData))
	}
}

extension RegistrationViewController: IRegistrationViewController {
	func render(viewModel: RegistrationModel.ViewModel) {
		print(viewModel.message)
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
		view.addSubview(signUpButtom)

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
		signUpButtom
			.pin
			.below(of: textFieldRepeatPass)
			.marginTop(Sizes.Padding.double)
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
	
	func makeSignUpButton() -> UIButton {
		let button = FilledButton(title: L10n.Authorization.signUp)
		button.configuration?.baseBackgroundColor = Theme.accentColor
		button.configuration?.baseForegroundColor = .white
		
		button.addTarget(self, action: #selector(makeSignUp), for: .touchUpInside)
		return button
	}
}
