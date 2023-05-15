//
//  CalendarViewModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 06.04.2023.
//

import Foundation

enum CalendarViewData {
	struct CalendarCellData {
		let dayNumber: Int
		let isCurrentDay: Bool
	}
	
	struct EmptyCellData {
		let dayNumber: Int
	}
	
	enum CellData {
		case currentMounthDay(CalendarCellData)
		case previusMounthDay(EmptyCellData)
		case nextMounthDay(EmptyCellData)
	}
}
