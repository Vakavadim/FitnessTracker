//
//  Sizes.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 01.04.2023.
//

import Foundation
import PinLayout
import UIKit

enum Sizes {
	static let cornerRadius: CGFloat = 15
	static let borderWidth: CGFloat = 1
	static let dayLabelWidth: Percent = 5%
	
	enum CalendarView {
		static let weekHeight: CGFloat = 190
		static let mounthHeight: CGFloat = 450
		static let numberOfColumns: CGFloat = 7
		static let numberOfInsections: CGFloat = 6
		static let mounthViewSize = CGRect(
			x: 0,
			y: 0,
			width: UIScreen.main.bounds.width,
			height: 450
		)
		static let weekViewSize = CGRect(
			x: 0,
			y: 0,
			width: UIScreen.main.bounds.width,
			height: 200
		)
		
		enum S { // swiftlint:disable:this type_name
			static let width: CGFloat = 40
			static let height: CGFloat = 50
		}
	}
	
	enum Padding {
		static let minimal: CGFloat = 4
		static let half: CGFloat = 8
		static let normal: CGFloat = 16
		static let double: CGFloat = 32
		static let biggest: CGFloat = 64
	}
	
	enum L { // swiftlint:disable:this type_name
		static let width: Percent = 90%
		static let height: CGFloat = 80
	}
	
	enum M { // swiftlint:disable:this type_name
		static let width: Percent = 70%
		static let height: CGFloat = 60
	}
	
	enum S { // swiftlint:disable:this type_name
		static let width: CGFloat = 40
		static let height: CGFloat = 50
	}
}
