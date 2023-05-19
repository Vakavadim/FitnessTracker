//
//  LoginViewController.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 09.03.2023.
//

import UIKit
import PinLayout

class LoginViewController: UIViewController {
	private lazy var calendarView = makeCalendarView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .lightGray
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}
}

extension LoginViewController {
	func layout() {
		view.addSubview(calendarView)
		
		calendarView.pin
			.top()
			.left()
			.right()
		
		calendarView.updateCollectionViewLayout()
	}
	
	func makeCalendarView() -> CalendarView {
		let view = CalendarView(calendarManager: CalendarManager())
		
		return view
	}
}
