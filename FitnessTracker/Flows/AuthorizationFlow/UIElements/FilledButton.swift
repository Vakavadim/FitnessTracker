//
//  FilledButton.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import UIKit

final class FilledButton: UIButton {
	let title: String

	init(title: String) {
		self.title = title
		super.init(frame: CGRect())
		setupUI()
	}
	
	private func setupUI() {
		var attributedString = AttributedString(self.title)
		var container = AttributeContainer()
		container.font = UIFont.preferredFont(forTextStyle: .callout)
		attributedString.mergeAttributes(container, mergePolicy: .keepNew)

		self.configuration = .filled()
		self.configuration?.cornerStyle = .medium
		self.configuration?.attributedTitle = attributedString
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
