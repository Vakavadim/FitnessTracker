//
//  PlainButton.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 06.07.2023.
//

import UIKit

final class PlainButton: UIButton {
	let text: String

	init(text: String) {
		self.text = text
		super.init(frame: CGRect())
		setupUI()
	}
	
	private func setupUI() {
		var attributedString = AttributedString(text)
		var container = AttributeContainer()
		container.font = UIFont.preferredFont(forTextStyle: .headline)
		attributedString.mergeAttributes(container, mergePolicy: .keepNew)

		self.configuration = .plain()
		self.configuration?.baseForegroundColor = Theme.accentColor
		self.configuration?.attributedTitle = attributedString
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
