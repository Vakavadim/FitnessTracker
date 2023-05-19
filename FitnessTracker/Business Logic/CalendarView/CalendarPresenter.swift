//
//  CalendarPresenter.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import Foundation

protocol ICalendarPresenter {
	func viewIsReady()
	func didSelectedDate(indexPath: IndexPath)
	func didPressResizeButton()
}

class CalendarPresenter: ICalendarPresenter {
	private var isWeekCalendar = false
	private let calendarManager: ICalendarManager
	private unowned let view: ICalendarView
	
	init(view: ICalendarView, calendarManager: ICalendarManager) {
		self.view = view
		self.calendarManager = calendarManager
	}
	
	func viewIsReady() {
	}
	
	func didSelectedDate(indexPath: IndexPath) {
	}
	
	func didPressResizeButton() {
	}
}
