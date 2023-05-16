//
//  CalendarManagerDataModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.05.2023.
//

import Foundation

enum CalendarDataModel {
	case week(Week)
	case month(Month)
	
	struct Week {
		let dates: [Date]
	}
	
	struct Month {
		let previusMonthDates: [Date]
		let currentMonthDates: [Date]
		let nextMonthDates: [Date]
	}
}
