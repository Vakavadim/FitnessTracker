//
//  CalendarCellFactory.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import UIKit

//class CalendarCellFactory {
//	static func cellForCollectionView(
//		_ collectionView: UICollectionView,
//		indexPath: IndexPath,
//		model: CalendarDataModel
//	) -> UICollectionViewCell {
//		switch model {
//		case .currentMonthDay(let date):
//			return cellForCurrentMonthDay(collectionView, indexPath: indexPath, date: date)
//		case .otherMonthDay(let date):
//			return cellForOtherMonthDay(collectionView, indexPath: indexPath, date: date)
//		}
//	}
//
//	private static func cellForCurrentMonthDay(
//		_ collectionView: UICollectionView,
//		indexPath: IndexPath,
//		date: Date
//	) -> UICollectionViewCell {
//		guard let cell = collectionView.dequeueReusableCell(
//			withReuseIdentifier: CurrentMonthDayCell.reuseIdentifier, for: indexPath
//		) as? CurrentMonthDayCell else {
//			fatalError("Unable to dequeue CurrentMonthDayCell")
//		}
//
//		let selectedDate = /* Get the selected date from your data source */
//		cell.configure(date: date, selectedDate: selectedDate)
//
//		return cell
//	}
//
//	private static func cellForOtherMonthDay(
//		_ collectionView: UICollectionView,
//		indexPath: IndexPath,
//		date: Date
//	) -> UICollectionViewCell {
//		guard let cell = collectionView.dequeueReusableCell(
//			withReuseIdentifier: OtherMonthDayCell.reuseIdentifier, for: indexPath
//		) as? OtherMonthDayCell else {
//			fatalError("Unable to dequeue OtherMonthDayCell")
//		}
//
//		let selectedDate = /* Get the selected date from your data source */
//		cell.configure(date: date, selectedDate: selectedDate)
//
//		return cell
//	}
//}
