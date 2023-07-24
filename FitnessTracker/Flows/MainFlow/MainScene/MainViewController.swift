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
		view.addSubview(calendar)
		
		calendar
			.pin
			.top()
			.left()
			.right()
	}
	
	func makeCalendarView() -> CalendarView {
		let calendar = CalendarView()
		calendar.delegate = self
		calendar.updateCollectionViewLayout()
		return calendar
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
