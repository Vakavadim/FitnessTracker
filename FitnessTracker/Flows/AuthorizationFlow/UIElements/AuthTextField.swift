//
//  AuthTextField.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 06.07.2023.
//

import UIKit

final class AuthTextField: UITextField {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = Theme.textFieldBackgroundColor
		self.textColor = .black
		self.layer.borderWidth = Sizes.borderWidth
		self.layer.cornerRadius = Sizes.cornerRadius
		self.layer.borderColor = UIColor.lightGray.cgColor
		self.leftView = UIView(
			frame: CGRect(
				x: 0,
				y: 0,
				width: Sizes.Padding.normal,
				height: self.frame.height
			)
		)
		self.leftViewMode = .always
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
