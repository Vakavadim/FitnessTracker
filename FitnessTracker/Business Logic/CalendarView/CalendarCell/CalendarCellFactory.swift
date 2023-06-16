//
//  CalendarCellFactory.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import UIKit

final class CalendarCellFactory { // swiftlint:disable:this convenience_type
	static func cellForCollectionView(
		_ collectionView: UICollectionView,
		indexPath: IndexPath,
		model: CalendarModel.CellData
	) -> UICollectionViewCell {
		if collectionView == collectionView as? CurrentMonthCollectionView {
			switch model {
			case .currentMonthDay(let dayData):
				return cellForCurrentMonthDay(collectionView, indexPath: indexPath, dayData: dayData)
			case .otherMonthDay(let dayData):
				return cellForOtherMonthDay(collectionView, indexPath: indexPath, dayData: dayData)
			}
		} else {
			switch model {
			case .currentMonthDay(let dayData):
				return cellForOtherMonthDay(collectionView, indexPath: indexPath, dayData: dayData)
			case .otherMonthDay(let dayData):
				return cellForOtherMonthDay(collectionView, indexPath: indexPath, dayData: dayData)
			}
		}
	}

	private static func cellForCurrentMonthDay(
		_ collectionView: UICollectionView,
		indexPath: IndexPath,
		dayData: CalendarModel.DayData
	) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: CurrentMonthDayCell.reuseIdentifier, for: indexPath
		) as? CurrentMonthDayCell else {
			fatalError("Unable to dequeue CurrentMonthDayCell")
		}

		cell.configure(dayData: dayData)

		return cell
	}

	private static func cellForOtherMonthDay(
		_ collectionView: UICollectionView,
		indexPath: IndexPath,
		dayData: CalendarModel.DayData
	) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: OtherMonthDayCell.reuseIdentifier, for: indexPath
		) as? OtherMonthDayCell else {
			fatalError("Unable to dequeue OtherMonthDayCell")
		}

		cell.configure(dayData: dayData)

		return cell
	}
}
