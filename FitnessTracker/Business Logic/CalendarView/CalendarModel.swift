//
//  CalendarModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import Foundation

struct CalendarViewModel {
	struct Day {
		let date: Date
		let isSelected: Bool
		let isCurrent: Bool
	}
	
	enum CellData {
		case currentMonthDay(Day)
		case otherMonthDay(Day)
	}
	
	let calendarDays: [CellData]
}
