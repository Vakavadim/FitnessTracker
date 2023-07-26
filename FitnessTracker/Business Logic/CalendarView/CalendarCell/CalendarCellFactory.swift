//
//  CalendarCellFactory.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.05.2023.
//

import UIKit


/// Класс CalendarCellFactory представляет шаблон фабрики, который упрощает создание и конфигурацию
/// ячеек календаря, скрывая детали реализации от внешних компонентов и обеспечивая единый интерфейс
/// для работы с различными типами ячеек.
final class CalendarCellFactory { // swiftlint:disable:this convenience_type
	
	/// метод cellForCollectionView создает и возвращает соответствующую ячейку (UICollectionViewCell)
	/// для определенного типа данных CalendarModel.CellData и
	/// определенного местоположения (indexPath) в коллекции UICollectionView.
	/// - Parameters:
	///   - collectionView: Коллекция ячеек UICollectionView, для которой необходимо создать ячейку.
	///   - indexPath: Индекс ячейки в коллекции.
	///   - model: CalendarModel.CellData - данные, используемые для конфигурации ячейки.
	/// - Returns: Метод возвращает требуемый тип ячейки CurrentMonthDayCell для дня текущего месяца и OtherMonthDayCell для других дней.
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

	
	/// метод cellForCurrentMonthDay является частью фабрики CalendarCellFactory,
	/// его цель - создать и настроить ячейку типа CurrentMonthDayCell для текущего месяца в календаре.
	/// - Parameters:
	///   - collectionView: Коллекция ячеек UICollectionView, из которой будет получена переиспользуемая ячейка.
	///   - indexPath: Индекс ячейки в коллекции, для которой необходимо получить ячейку.
	///   - dayData: данные для конфигурации ячейки текущего дня (CurrentMonthDayCell).
	/// - Returns: Метод возвращает настроенную ячейку cell, которая будет использована в методе cellForCollectionView для отображения текущего дня календаря.
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

	/// метод cellForOtherMonthDay является частью фабрики CalendarCellFactory,
	/// его цель - создать и настроить ячейку типа OtherMonthDayCell для текущего месяца в календаре.
	/// - Parameters:
	///   - collectionView: Коллекция ячеек UICollectionView, из которой будет получена переиспользуемая ячейка.
	///   - indexPath: Индекс ячейки в коллекции, для которой необходимо получить ячейку.
	///   - dayData: данные для конфигурации ячейки текущего дня (OtherMonthDayCell).
	/// - Returns: Метод возвращает настроенную ячейку cell, которая будет использована в методе cellForCollectionView для отображения текущего дня календаря.
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
