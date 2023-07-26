//
//  MainViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 20.07.2023.
//

import UIKit
import PinLayout

#if DEBUG
import SwiftUI
#endif

protocol IMainViewController: AnyObject {
	func render(viewModel: MainModel.ViewModel)
}

class MainViewController: UIViewController {

	// MARK: - Dependencies

	var interactor: IMainInteractor?

	// MARK: - Private properties
	private lazy var calendar = makeCalendarView()
	private lazy var userButton = makeUserButton()
	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.isNavigationBarHidden = false
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

extension MainViewController: IMainViewController {
	func render(viewModel: MainModel.ViewModel) {
	}
}

private extension MainViewController {
	/// Метод layoutPinLayout выполняет размещения элементов интерфейса
	/// при помощи библиотеки Pinlayout.
	func layoutPinLayout() {
		view.addSubview(userButton)
		view.addSubview(calendar)

		userButton
			.pin
			.top(Sizes.Padding.double)
			.right()
			.margin(Sizes.Padding.normal)
			.width(Sizes.S.width)
			.height(Sizes.S.width)
		calendar
			.pin
			.below(of: userButton)
			.marginTop(Sizes.Padding.half)
			.left()
			.right()
	}
	
	func makeCalendarView() -> CalendarView {
		let calendar = CalendarView()
		let calendarAppearance = CalendarAppearance(
			baseBackgroundColor: Theme.backgroundColor,
			baseForegroundColor: Theme.accentColor,
			selectedDateBackgroundColor: Theme.accentColor,
			currentDateBackgroundColor: Theme.accentColor,
			accentColor: Theme.accentColor
		)
		calendar.calendarAppearance = calendarAppearance
		calendar.delegate = self
		calendar.updateCollectionViewLayout()
		return calendar
	}
	
	func makeUserButton() -> UIButton {
		let button = UIButton()
		button.configuration = .filled()
		button.configuration?.cornerStyle = .medium
		button.configuration?.baseBackgroundColor = Theme.accentColor
		button.configuration?.baseForegroundColor = .white
		button.configuration?.image = UIImage(systemName: "person.crop.circle.fill")
		button.addTarget(self, action: #selector(someAction), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}
}

extension MainViewController: CalendarViewDelegate {
	func didSelectedDate(date: Date) {
		print(date)
	}
}

#if DEBUG
struct Provider: PreviewProvider {
	static var previews: some View {
		Group {
			MainViewController().preview()
		}
	}
}
#endif
