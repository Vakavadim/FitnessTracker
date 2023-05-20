//
//  CalendarViewCell.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 05.04.2023.
//

import UIKit
import PinLayout

class CalendarCell: UICollectionViewCell {
	
	// MARK: - Private properties

	private lazy var titleLabel: UILabel = makeLabel()
	private lazy var currentDayIndicatorView: UIView = makeView()
	
	// MARK: - Private methods
	
	private func makeLabel() -> UILabel {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = .gray
		label.textAlignment = .center
		return label
	}
	
	private func makeView() -> UIView {
		let view = UIView()
		view.backgroundColor = .red
		
		return view
	}
	
	// MARK: - Public methods

	func configure(dayData: CalendarModel.DayData) {
		let dateFormator = DateFormatter()
		dateFormator.dateFormat = "d"
		titleLabel.text = dateFormator.string(from: dayData.date)
		if dayData.isCurrent {
			currentDayIndicatorView.isHidden = false
		} else {
			currentDayIndicatorView.isHidden = true
		}
	}
}

class OtherMonthDayCell: UICollectionViewCell {
	static let reuseIdentifier = "OtherMonthDayCell"
	
	// MARK: - Private properties

	private lazy var titleLabel: UILabel = makeLabel()
	private lazy var currentDayIndicatorView: UIView = makeView()
	
	// MARK: - Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		currentDayIndicatorView.isHidden = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		layout()
	}
	
	// MARK: - Private methods

	private func setupView() {
		contentView.addSubview(currentDayIndicatorView)
		contentView.addSubview(titleLabel)
	}
	
	// MARK: - Public methods

	func configure(dayData: CalendarModel.DayData) {
		let dateFormator = DateFormatter()
		dateFormator.dateFormat = "d"
		titleLabel.text = dateFormator.string(from: dayData.date)
		if dayData.isCurrent {
			currentDayIndicatorView.isHidden = false
		} else {
			currentDayIndicatorView.isHidden = true
		}
	}
}

// MARK: - Layout

private extension OtherMonthDayCell {
	func layout() {
		currentDayIndicatorView
			.pin
			.top()
			.left()
			.right()
			.bottom(10)
		currentDayIndicatorView.layer.cornerRadius = currentDayIndicatorView.frame.width / 2
		currentDayIndicatorView.backgroundColor = .red
		
		titleLabel
			.pin
			.top()
			.left()
			.right()
			.bottom(10)
	}
	
	// MARK: - Make Views Methods
	
	func makeLabel() -> UILabel {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = .gray
		label.textAlignment = .center
		return label
	}
	
	func makeView() -> UIView {
		let view = UIView()
		view.backgroundColor = .red
		
		return view
	}
}
