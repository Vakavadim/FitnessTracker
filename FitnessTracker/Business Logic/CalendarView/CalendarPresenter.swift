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
	
	// MARK: - Private properties
	
	private var isWeekCalendar = false
	private var selectedDate: Date?
	private let calendarManager: ICalendarManager
	private unowned let view: ICalendarView
	
	// MARK: - Lifecycle
	
	init(view: ICalendarView, calendarManager: ICalendarManager) {
		self.view = view
		self.calendarManager = calendarManager
	}
	
	// MARK: - Public methods
	
	func viewIsReady() {
		view.render(viewData: mapViewData())
	}
	
	func didSelectedDate(indexPath: IndexPath) {
	}
	
	func didPressResizeButton() {
	}
	
	// MARK: - Private methods
	
	private func mapViewData() -> CalendarModel.ViewModel {
		let currentDate = calendarManager.makeDateWithDefaultTime(date: Date())
		let calendarSize = isWeekCalendar
		? Sizes.CalendarView.weekViewSize
		: Sizes.CalendarView.mounthViewSize
		let viewModel = CalendarModel.ViewModel(
			dateString: calendarManager.getMonthAndYearString(date: selectedDate ?? currentDate),
			calendarViewSize: calendarSize,
			calendarDays: mapCellData()
		)
		return viewModel
	}
	
	private func mapCellData() -> [CalendarModel.CellData] {
		let currentDate = calendarManager.makeDateWithDefaultTime(date: Date())
		let days = isWeekCalendar
		? calendarManager.getDatesForWeekCalendar(date: selectedDate ?? currentDate)
		: calendarManager.getDatesForMonthCalendar(date: selectedDate ?? currentDate)
		
		var data: [CalendarModel.CellData] = []
		
		for day in days {
			switch day {
			case .currentMonthDay(let date):
				let day = CalendarModel.DayData(
					date: date,
					isSelected: selectedDate == date,
					isCurrent: currentDate == date
				)
				let cellData = CalendarModel.CellData.currentMonthDay(day)
				data.append(cellData)
			case .otherMonthDay(let date):
				let day = CalendarModel.DayData(
					date: date,
					isSelected: selectedDate == date,
					isCurrent: currentDate == date
				)
				let cellData = CalendarModel.CellData.otherMonthDay(day)
				data.append(cellData)
			}
		}
		
		return data
	}
}
