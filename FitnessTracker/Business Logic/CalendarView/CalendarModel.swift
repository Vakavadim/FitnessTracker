//
//  CalendarModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import Foundation

struct CalendarModel {
	struct DayData {
		let date: Date
		let isSelected: Bool
		let isCurrent: Bool
	}
	
	enum CellData {
		case currentMonthDay(DayData)
		case otherMonthDay(DayData)
	}
	
	struct ViewModel {
		let dateString: String
		let calendarViewSize: CGRect
		let calendarDays: [CellData]
	}
	
	let viewModel: ViewModel
}
