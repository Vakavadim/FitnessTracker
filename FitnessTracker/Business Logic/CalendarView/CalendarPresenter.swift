//
//  CalendarPresenter.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import Foundation

protocol ICalendarPresenter {
	func viewIsReady()
	func didSelectedDate(indexPath: IndexPath) -> Date
	func didPressResizeButton()
	func back()
	func forward()
}

class CalendarPresenter: ICalendarPresenter {
	
	// MARK: - Private properties
	
	private var isWeekCalendar = true
	private var selectedDate: Date?
	private var date: Date?
	private let calendarManager: ICalendarManager
	private unowned let view: ICalendarView
	
	// MARK: - Lifecycle
	
	init(view: ICalendarView, calendarManager: ICalendarManager) {
		self.view = view
		self.calendarManager = calendarManager
		self.date = calendarManager.makeDateWithDefaultTime(date: Date())
	}
	
	// MARK: - Public methods
	
	func viewIsReady() {
		guard let date = self.date else {
			fatalError("Date is not found")
		}
		view.render(viewData: mapViewData(date: date))
	}
	
	func didSelectedDate(indexPath: IndexPath) -> Date {
		guard let date = self.date else {
			fatalError("Date is not found")
		}
		let cellData = mapCellData(date: date)
		switch cellData[indexPath.item] {
		case .currentMonthDay(let dayData):
			let date = dayData.date
			selectedDate = date
			viewIsReady()
			return date
		case .otherMonthDay(let dayData):
			let date = dayData.date
			selectedDate = date
			if indexPath.item < 7 {
				back()
			} else {
				forward()
			}
			return date
		}
	}
	
	func didPressResizeButton() {
		isWeekCalendar.toggle()
		viewIsReady()
	}
	
	// MARK: - Private methods
	
	private func mapViewData(date: Date) -> CalendarModel.ViewModel {
		let calendarSize = isWeekCalendar
		? Sizes.CalendarView.weekViewSize
		: Sizes.CalendarView.mounthViewSize
		let viewModel = CalendarModel.ViewModel(
			dateString: calendarManager.getMonthAndYearString(date: date),
			calendarViewSize: calendarSize,
			calendarDays: mapCellData(date: date)
		)
		return viewModel
	}
	
	private func mapCellData(date: Date) -> [CalendarModel.CellData] {
		let currentDate = calendarManager.makeDateWithDefaultTime(date: Date())
		let days = isWeekCalendar
		? calendarManager.getDatesForWeekCalendar(date: date)
		: calendarManager.getDatesForMonthCalendar(date: date)
		
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
	
	func back() {
		guard let date = self.date else {
			fatalError("Date is not found")
		}
		self.date = calendarManager.back(date: date, isWeek: isWeekCalendar)
		viewIsReady()
	}
	
	func forward() {
		guard let date = self.date else {
			fatalError("Date is not found")
		}
		self.date = calendarManager.forward(date: date, isWeek: isWeekCalendar)
		viewIsReady()
	}
}
