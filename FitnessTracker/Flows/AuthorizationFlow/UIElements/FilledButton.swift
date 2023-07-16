//
//  FilledButton.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import UIKit

final class FilledButton: UIButton {
	let text: String

	init(text: String, backgroundColor: UIColor) {
		self.text = text
		super.init(frame: CGRect())

		var attributedString = AttributedString(text)
		var container = AttributeContainer()
		container.font = UIFont.preferredFont(forTextStyle: .headline)
		attributedString.mergeAttributes(container, mergePolicy: .keepNew)

		self.configuration = .filled()
		self.configuration?.cornerStyle = .medium
		self.configuration?.baseForegroundColor = Theme.accentColor
		self.configuration?.attributedTitle = attributedString
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
