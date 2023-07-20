//
//  AuthorizationViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 10.06.2023.
//

import UIKit
import PinLayout

protocol IAuthorizationViewController: AnyObject {
	func render(viewModel: AuthorizationModel.ViewModel)
}

class AuthorizationViewController: UIViewController {

	// MARK: - Dependencies

	var interactor: IAuthorizationInteractor?

	// MARK: - Private properties

	private lazy var textFieldLogin: UITextField = makeLoginTextField()
	private lazy var textFieldPass: UITextField = makePasswordTextField()
	private lazy var buttonSignIn: UIButton = makeButtonSignIn()
	private lazy var buttonFacebookSignIn: UIButton = makeButtonFacebookSignIn()
	private lazy var buttonGoogleSignIn: UIButton = makeButtonGoogleSignIn()
	private lazy var line: UIView = makeLineView()
	private lazy var secondLine: UIView = makeLineView()
	private lazy var orLabel: UILabel = makeOrLabel()
	private lazy var signUpButton: UIButton = makeSignUpButton()
	private lazy var passRecoveryButton: UIButton = makePassRecoveryButton()
	private var loginText: String {
		get {
			textFieldLogin.text ?? ""
		}
		set {
			textFieldLogin.text = newValue
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
		title = L10n.Authorization.title
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	// MARK: - Actions

	@objc
	func signIn() {
		let loginData = AuthorizationModel.LoginData(
			login: Email(loginText),
			password: Password(passText)
		)

		interactor?.makeRequest(request: .login(loginData))
	}

	@objc
	func facebookSignIn() {
	}
	
	@objc
	func googleSignIn() {
	}
	
	@objc
	func signUp() {
		interactor?.makeRequest(request: .signUp)
	}
	
	@objc
	func passRecovery() {
		interactor?.makeRequest(
			request: .forgotPass(Email(loginText))
		)
	}
}

extension AuthorizationViewController: IAuthorizationViewController {
	func render(viewModel: AuthorizationModel.ViewModel) {
		DispatchQueue.main.async {
			self.presentAlert(
				title: L10n.Authorization.alertTitle,
				message: viewModel.errorMessage
			)
		}
	}
}

private extension AuthorizationViewController {
	
	/// Метод layoutPinLayout выполняет размещения элементов интерфейса
	/// при помощи библиотеки Pinlayout.
	func layoutPinLayout() { // swiftlint:disable:this function_body_length
		view.addSubview(textFieldLogin)
		view.addSubview(textFieldPass)
		view.addSubview(buttonSignIn)
		view.addSubview(orLabel)
		view.addSubview(line)
		view.addSubview(secondLine)
		view.addSubview(buttonFacebookSignIn)
		view.addSubview(buttonGoogleSignIn)
		view.addSubview(signUpButton)
		view.addSubview(passRecoveryButton)

		textFieldLogin
			.pin
			.top(Sizes.topOffset)
			.hCenter()
			.width(Sizes.L.width)
			.height(Sizes.S.height)

		textFieldPass
			.pin
			.hCenter()
			.below(of: textFieldLogin)
			.margin(Sizes.Padding.normal)
			.width(Sizes.L.width)
			.height(Sizes.S.height)

		buttonSignIn
			.pin
			.hCenter()
			.below(of: textFieldPass)
			.margin(Sizes.Padding.double)
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		
		orLabel
			.pin
			.hCenter()
			.below(of: buttonSignIn)
			.width(Sizes.S.width)
			.height(Sizes.S.height)
		
		line
			.pin
			.before(of: orLabel, aligned: .center)
			.margin(Sizes.Padding.half)
			.height(0.5)
			.width(Sizes.Spacer.lineWidth)
		
		secondLine
			.pin
			.after(of: orLabel, aligned: .center)
			.margin(Sizes.Padding.half)
			.height(Sizes.Spacer.borderWidth)
			.width(Sizes.Spacer.lineWidth)
		
		buttonFacebookSignIn
			.pin
			.hCenter()
			.below(of: orLabel)
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		
		buttonGoogleSignIn
			.pin
			.hCenter()
			.below(of: buttonFacebookSignIn)
			.margin(Sizes.Padding.normal)
			.width(Sizes.L.width)
			.height(Sizes.S.height)
		
		signUpButton
			.pin
			.below(of: buttonGoogleSignIn, aligned: .left)
			.height(Sizes.S.height)
		
		passRecoveryButton
			.pin
			.below(of: buttonGoogleSignIn, aligned: .right)
			.height(Sizes.S.height)
	}

	func makeLoginTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.email
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}
	
	func makePasswordTextField() -> UITextField {
		let textField = AuthTextField()

		textField.placeholder = L10n.Authorization.Placeholder.password
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}

	func makeButtonSignIn() -> UIButton {
		let button = FilledButton(title: L10n.Authorization.authorization)
		button.configuration?.baseBackgroundColor = Theme.accentColor
		button.configuration?.baseForegroundColor = .white

		button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}
	
	func makeButtonFacebookSignIn() -> UIButton {
		let button = FilledButton(title: L10n.Authorization.facebookSignIn)
		button.configuration?.baseBackgroundColor = Theme.blueButtonBackground
		button.configuration?.baseForegroundColor = .white

		let imageContainerView = UIView()
		imageContainerView.translatesAutoresizingMaskIntoConstraints = false
		button.addSubview(imageContainerView)
		
		let imageView = UIImageView(image: Asset.facebookIconJpg.image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageContainerView.addSubview(imageView)
		
		NSLayoutConstraint.activate(
			[
				imageContainerView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: Sizes.Padding.normal),
				imageContainerView.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
				imageContainerView.widthAnchor.constraint(equalToConstant: Sizes.Icon.S.size),
				imageContainerView.heightAnchor.constraint(equalToConstant: Sizes.Icon.S.size),
				imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
				imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
				imageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor),
				imageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor)
			]
		)

		button.addTarget(self, action: #selector(facebookSignIn), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}
	
	func makeButtonGoogleSignIn() -> UIButton {
		let button = FilledButton(title: L10n.Authorization.googleSignIn)
		button.configuration?.baseBackgroundColor = Theme.orangeButtonBackground
		button.configuration?.baseForegroundColor = .white
		
		let imageContainerView = UIView()
		imageContainerView.translatesAutoresizingMaskIntoConstraints = false
		button.addSubview(imageContainerView)
		
		let imageView = UIImageView(image: Asset.googleIcon.image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageContainerView.addSubview(imageView)
		
		NSLayoutConstraint.activate(
			[
				imageContainerView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: Sizes.Padding.normal),
				imageContainerView.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
				imageContainerView.widthAnchor.constraint(equalToConstant: Sizes.Icon.S.size),
				imageContainerView.heightAnchor.constraint(equalToConstant: Sizes.Icon.S.size),
				imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
				imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
				imageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor),
				imageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor)
			]
		)

		button.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}

	func makeLineView() -> UIView {
		let lineView = UIView()
		lineView.backgroundColor = Theme.accentColor
		return lineView
	}

	func makeOrLabel() -> UILabel {
		let label = UILabel()
		label.text = L10n.Authorization.orLabel
		label.textAlignment = .center
		label.textColor = Theme.accentColor
		label.font = UIFont.preferredFont(forTextStyle: .subheadline)
		return label
	}

	func makeSignUpButton() -> UIButton {
		let button = PlainButton(text: L10n.Authorization.registration)
		
		button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}

	func makePassRecoveryButton() -> UIButton {
		let button = PlainButton(text: L10n.Authorization.passwordRecovery)

		button.addTarget(self, action: #selector(passRecovery), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}
}
