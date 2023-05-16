//
//  CalendarViewCell.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 05.04.2023.
//

import UIKit
import PinLayout

class CalendarViewCell: UICollectionViewCell {
	static let reuseIdentifier = "CalendarViewCell"

	private lazy var titleLabel: UILabel = makeLabel()
	private lazy var indicatorView: UIView = makeView()
	
	 // MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupView() {
		contentView.addSubview(indicatorView)
		contentView.addSubview(titleLabel)
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		layout()
	}

	func configure(title: String) {
		titleLabel.text = title
	}
}

// MARK: - Layout
private extension CalendarViewCell {
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
