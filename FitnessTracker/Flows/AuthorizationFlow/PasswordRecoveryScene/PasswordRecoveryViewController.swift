//
//  PasswordRecoveryViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import UIKit
import PinLayout

protocol IPasswordRecoveryViewController: AnyObject {
	func render(viewModel: PasswordRecoveryModel.ViewModel)
}

class PasswordRecoveryViewController: UIViewController {

	// MARK: - Dependencies

	var interactor: IPasswordRecoveryInteractor?
	var email: Email?

	// MARK: - Private properties
	private lazy var textFieldEmail: UITextField = makeEmailTextField()
	private lazy var changePassButtom: UIButton = makeChangePassButton()
	private var emailText: String {
		get {
			textFieldEmail.text ?? ""
		}
		set {
			textFieldEmail.text = newValue
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
		title = L10n.Authorization.resetPassword
		textFieldEmail.text = email?.rawValue ?? ""
	}

	// MARK: - Actions
	@objc
	func reset() {
		interactor?.recoveryPassword(
			request: .resetPass(Email(emailText))
		)
	}
}

extension PasswordRecoveryViewController: IPasswordRecoveryViewController {
	func render(viewModel: PasswordRecoveryModel.ViewModel) {
		switch viewModel {
		case .success(let message):
			self.presentAlert(title: "Success", message: message) {
				self.navigationController?.popViewController(animated: true)
			}
		case .error(let errorMessage):
			self.presentAlert(title: "Error", message: errorMessage) {
				self.textFieldEmail.text = ""
			}
		}
	}
}

private extension PasswordRecoveryViewController {
	
	/// Метод layoutPinLayout выполняет размещения элементов интерфейса
	/// при помощи библиотеки Pinlayout.
	func layoutPinLayout() {
		view.addSubview(textFieldEmail)
		view.addSubview(changePassButtom)
		
		textFieldEmail
			.pin
			.top(Sizes.topOffset)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		changePassButtom
			.pin
			.below(of: textFieldEmail)
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

	func makeChangePassButton() -> UIButton {
		let button = FilledButton(title: L10n.Authorization.recoveryButtonTitle)
		button.configuration?.baseBackgroundColor = Theme.accentColor
		button.configuration?.baseForegroundColor = .white
		
		button.addTarget(self, action: #selector(reset), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}
}
