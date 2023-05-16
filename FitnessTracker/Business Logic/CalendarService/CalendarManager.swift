//
//  CalendarManager.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 15.05.2023.
//

import Foundation

protocol ICalendarManager {
	func makeDateWithDefaultTime(date: Date) -> Date
	func getDatesForWeekCalendar(date: Date) -> CalendarDataModel.Week
	func getDatesForMonthCalendar(date: Date) -> CalendarDataModel.Month
}

final class CalendarManager {
	
	// MARK: - Private properties
	
	private let calendar = Calendar.current
	
	// MARK: - Private methods
	
	/// Метод addMonth добавляет заданное количество месяцев к переданной дате.
	/// - Parameters:
	///   - date: Дата в формате Date к значению которой будет прибавлятсья заданное количество месяцев.
	///   - month: Целочисленное значение на которое измениться значение месяцев в переданной дате.
	/// - Returns: Метод возвращает новое значение Date.
	private func addMonth(date: Date, month: Int) -> Date {
		guard let date = calendar.date(byAdding: .month, value: month, to: date) else {
			fatalError("CalendarManagerError: Failed to calculate new date in addMonth function")
		}
		return date
	}
	
	/// Метод addDay добавляет заданное количество дней к переданной дате.
	/// - Parameters:
	///   - date: Дата в формате Date к значению которой будет прибавлятсья заданное количество дней.
	///   - month: Целочисленное значение дней на которое измениться дата.
	/// - Returns: Метод возвращает новое значение Date.
	private func addDay(date: Date, days: Int) -> Date {
		guard let date = calendar.date(byAdding: .day, value: days, to: date) else {
			fatalError("CalendarManagerError: Failed to calculate new date in addDay function")
		}
		return date
	}
	
	/// Метод monthStringOf возвращает имя месяца в формате String.
	private func monthStringOf(date: Date) -> String {
		let dateFormator = DateFormatter()
		dateFormator.dateFormat = "LLLL"
		
		return dateFormator.string(from: date).capitalized
	}
	
	/// Метод yearStringOf возвращает год в формате String.
	private func yearStringOf(date: Date) -> String {
		let dateFormator = DateFormatter()
		dateFormator.dateFormat = "yyyy"
		
		return dateFormator.string(from: date)
	}
	
	/// Метод getNumberOfDaysInMouthOf количество дней в месяце.
	private func getNumberOfDaysInMonthOf(date: Date) -> Int {
		guard let range = calendar.range(of: .day, in: .month, for: date) else {
			fatalError("CalendarManagerError: Failed to calculate number of days in getNumberOfDaysInMonthOf function")
		}
		return range.count
	}
	
	/// Метод getDayNumberOf возвращает число месяца передаваемой даты в формате Int.
	private func getDayNumberOf(date: Date) -> Int {
		guard let components = calendar.dateComponents([.day], from: date).day else {
			fatalError("CalendarManagerError: Failed to calculate number of days in getDayNumberOf function")
		}
		return components
	}
	
	/// Метод getWeekDayIndexOf индекс дня недели даты переданной в качестве параметра.
	private func getWeekDayIndexOf(date: Date) -> Int {
		guard let component = calendar.dateComponents([.weekday], from: date).weekday else {
			fatalError("CalendarManagerError: Failed to calculate index of week day in getWeekDayIndexOf function")
		}
		return component
	}
	
	/// Метод getDateWith возвращает дату с заданным числом месяца.
	private func getDateWith(day: Int, of date: Date) -> Date? {
		let dayNumber = getNumberOfDaysInMonthOf(date: date)
		let currentDayComponents = calendar.dateComponents([.year, .month], from: date)
		
		if Array(1...dayNumber).contains(day) {
			let dateCompnent = DateComponents(
				calendar: calendar,
				year: currentDayComponents.year,
				month: currentDayComponents.month,
				day: day
			)
			let dateFromDateComponents = calendar.date(from: dateCompnent)
			return dateFromDateComponents
		}
		
		return nil
	}
	
	/// Метод firstDayOfMonth возвращает первый день месяца.
	private func firstDayOfMonth(date: Date) -> Date {
		let components = calendar.dateComponents([.year, .month], from: date)
		guard let date = calendar.date(from: components) else {
			fatalError("CalendarManagerError: Failed to calculate the date in firstDayOfMonth function")
		}
		return date
	}
	
	/// Метод firstDayOfMonth возвращает последний день месяца.
	private func  lastDayOfMonth(date: Date) -> Date {
		let components = calendar.dateComponents([.year, .month], from: date)
		guard let firstDayOfMonth = calendar.date(from: components) else {
			fatalError("CalendarManagerError: Failed to calculate the date in firstDayOfMonth function")
		}
		let firstDayOfNextMonth = addMonth(date: firstDayOfMonth, month: 1)
		let lastDayOfMonth = addDay(date: firstDayOfNextMonth, days: -1)

		return lastDayOfMonth
	}
	
	/// Метод sundayForDate возвращает первый день недели для текущей даты;
	private func sundayForDate(date: Date) -> Date {
		var current = date
		let oneWeekAgo = addDay(date: current, days: -7)
		
		while current > oneWeekAgo {
			let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
			if currentWeekDay == Weekdays.sunday.rawValue {
				return current
			}
			current = addDay(date: current, days: -1)
		}
		return current
	}
	
	/// Метод getDatesForMonthCalendar возвращает дни текущего месяца для месячного предстаяления календаря.
	private func getDatesOfCurrentMonthForMonthCalendar(date: Date) -> [Date] {
		var dates: [Date] = []
		var current = firstDayOfMonth(date: date)
		var nextMonth = addMonth(date: current, month: 1)
		
		while current < nextMonth {
			dates.append(current)
			current = addDay(date: current, days: -1)
		}
		
		return dates
	}
	
	/// Метод getDatesOfPreviusMonthCalendar возвращает дни преведущего месяца
	///  до начала первой недели текущего месяца.
	private func getDatesOfPreviusMonthCalendar(date: Date) -> [Date] {
		var dates: [Date] = []
		var current = firstDayOfMonth(date: date)
		
		while getWeekDayIndexOf(date: current) == Weekdays.sunday.rawValue {
			current = addDay(date: current, days: -1)
			dates.insert(current, at: 0)
		}
		
		return dates
	}
	
	/// Метод getDatesOfNextMonthCalendar возвращает дни следущего месяца до конца последней недели текущего месяца.
	private func getDatesOfNextMonthCalendar(date: Date) -> [Date] {
		var dates: [Date] = []
		var current = lastDayOfMonth(date: date)
		
		while getWeekDayIndexOf(date: current) == Weekdays.saturday.rawValue {
			current = addDay(date: current, days: 1)
			dates.append(current)
		}
		
		return dates
	}
	
	// MARK: - Public methods
	
	/// Метод makeDateWithDefaultTime преобразует date в date с идентичными
	///  для всех хранимых данных о дате параметрами времени.
	func makeDateWithDefaultTime(date: Date) -> Date {
		let components = calendar.dateComponents([.day, .year, .month], from: date)
		guard let date = calendar.date(from: components) else {
			fatalError("CalendarManagerError: Failed to calculate the date in makeDateWithDefaultTime function")
		}
		return date
	}
	
	/// Метод getDatesForWeekCalendar возвращает массив дат текущей недели.
	func getDatesForWeekCalendar(date: Date) -> CalendarDataModel.Week {
		let date = makeDateWithDefaultTime(date: date)
		var dates: [Date] = []
		var current = sundayForDate(date: date)
		let nextSunday = addDay(date: current, days: 7)
		
		while current < nextSunday {
			dates.append(current)
			current = addDay(date: current, days: 1)
		}
		return CalendarDataModel.Week(dates: dates)
	}
	
	/// Метод getDatesForWeekCalendar возвращает массив дат для отображения месячного представления календаря.
	func getDatesForMonthCalendar(date: Date) -> CalendarDataModel.Month {
		let date = makeDateWithDefaultTime(date: date)
		let previusMonthDates = getDatesOfPreviusMonthCalendar(date: date)
		let currentMonthDates = getDatesOfCurrentMonthForMonthCalendar(date: date)
		let nextMonthDates = getDatesOfNextMonthCalendar(date: date)
		
		return CalendarDataModel.Month(
			previusMonthDates: previusMonthDates,
			currentMonthDates: currentMonthDates,
			nextMonthDates: nextMonthDates
		)
	}
}

private enum Weekdays: Int {
	case sunday = 1
	case monday = 2
	case tuesday = 3
	case wednesday = 4
	case thursday = 5
	case friday = 6
	case saturday = 7
}
