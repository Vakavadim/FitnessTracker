//
//  CalendarViewCell.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 05.04.2023.
//

import UIKit
import PinLayout

class OtherMonthDayCell: UICollectionViewCell {
	static let reuseIdentifier = "OtherMonthDayCell"
	
	// MARK: - Private properties

	private lazy var titleLabel: UILabel = makeLabel()
	private lazy var indicatorView: UIView = makeView()
	
	// MARK: - Lifecycle
	
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

	func configure(date: Date, selectedDate: Date) {
		let dateFormator = DateFormatter()
		dateFormator.dateFormat = "dd"
		titleLabel.text = dateFormator.string(from: date)
		if date == selectedDate {
			indicatorView.isHidden = false
		} else {
			indicatorView.isHidden = true
		}
	}
}

// MARK: - Layout

private extension OtherMonthDayCell {
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