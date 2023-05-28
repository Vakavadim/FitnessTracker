//
//  CalendarView+MakeUIObjectMethods.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 26.05.2023.
//

import UIKit

extension CalendarView {
	// MARK: - Make Views methods
	
	func makeScrollView() -> UIScrollView {
		let scrollView = UIScrollView()

		return scrollView
	}
	
	func makeLabel() -> UILabel {
		let label = UILabel()
		label.text = "Октябрь 2023"
		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.textColor = .black
		
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}
	
	func makeDayLabel(day: String) -> UILabel {
		let dayLabel = UILabel()
		dayLabel.text = day
		dayLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
		dayLabel.textColor = .black
		dayLabel.textAlignment = .center
		
		dayLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate(
		 [
			dayLabel.widthAnchor.constraint(equalToConstant: Sizes.S.width)
		 ]
		)

		return dayLabel
	}
	
	func makeDayLabels(from weekDays: String) -> [UILabel] {
		var labels: [UILabel] = []
		let days = weekDays.components(separatedBy: " ")
		for day in days {
			let label = makeDayLabel(day: day)
			labels.append(label)
		}
		return labels
	}
	
	func makeWeekDaysStack() -> UIStackView {
		let stackView = UIStackView()
		let days = makeDayLabels(from: L10n.CalendarView.weekDays)
		let screenwWidth = UIScreen.main.bounds.width
		let elementWidth = Sizes.S.width
		let columnCount: CGFloat = Sizes.CalendarView.numberOfColumns
		let insertsCount: CGFloat = Sizes.CalendarView.numberOfInsections

		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = (screenwWidth - (elementWidth * columnCount) - Sizes.Padding.double) / insertsCount
		stackView.autoresizesSubviews = true
		stackView.contentMode = .scaleAspectFill

		for day in days {
			stackView.addArrangedSubview(day)
		}
		stackView.translatesAutoresizingMaskIntoConstraints = false

		return stackView
	}
	
	func makeCollectionView() -> UICollectionView {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.isScrollEnabled = false

		collectionView.translatesAutoresizingMaskIntoConstraints = false

		return collectionView
	}
	
	func makeButton() -> UIButton {
		let button = UIButton()
		button.setImage(UIImage(asset: Asset.homeIndicator), for: .normal)
		button.addTarget(self, action: #selector(changeCalendarSize), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}
}
