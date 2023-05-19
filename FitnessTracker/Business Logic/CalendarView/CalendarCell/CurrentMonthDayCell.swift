//
//  CurrentMonthDayCell.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 17.05.2023.
//

import UIKit
import PinLayout

class CurrentMonthDayCell: UICollectionViewCell {
	static let reuseIdentifier = "CurrentMonthDayCell"

	private lazy var titleLabel: UILabel = makeLabel()
	private lazy var indicatorView: UIView = makeView()
	
	 // MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		indicatorView.isHidden = true
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
		contentView.addSubview(indicatorView)
		contentView.addSubview(titleLabel)
	}
	
	// MARK: - Public methods

	func configure(dayData: CalendarModel.DayData) {
		let dateFormator = DateFormatter()
		dateFormator.dateFormat = "d"
		titleLabel.text = dateFormator.string(from: dayData.date)
		if dayData.isCurrent {
			indicatorView.isHidden = false
		} else {
			indicatorView.isHidden = true
		}
	}
}

// MARK: - Layout
private extension CurrentMonthDayCell {
	func layout() {
		indicatorView
			.pin
			.top()
			.left()
			.right()
			.bottom(10)
		indicatorView.layer.cornerRadius = indicatorView.frame.width / 2
		indicatorView.backgroundColor = .red
		
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
		label.textColor = .black
		label.textAlignment = .center
		return label
	}
	
	func makeView() -> UIView {
		let view = UIView()
		view.backgroundColor = .red
		
		return view
	}
}
