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
	static let cornerRadius: CGFloat = 10
	static let borderWidth: CGFloat = 0.5
	static let dayLabelWidth: Percent = 5%
	static let topOffset: Percent = 30%
	
	enum CalendarView {
		static let weekHeight: CGFloat = 160
		static let mounthHeight: CGFloat = 410
		static let numberOfColumns: CGFloat = 7
		static let numberOfInsections: CGFloat = 6
		static let mounthViewSize = CGRect(
			x: 0,
			y: 0,
			width: UIScreen.main.bounds.width,
			height: mounthHeight
		)
		static let weekViewSize = CGRect(
			x: 0,
			y: 0,
			width: UIScreen.main.bounds.width,
			height: weekHeight
		)
		
		enum S { // swiftlint:disable:this type_name
			static let width: CGFloat = 40
			static let height: CGFloat = 50
		}
	}
	
	enum Icon {
		enum S { // swiftlint:disable:this type_name
			static let size: CGFloat = 40
		}
	}
	
	enum Spacer {
		static let lineWidth: Percent = 38%
		static let spacerHeight: CGFloat = 40
		static let borderWidth: CGFloat = 0.5
	}
	
	enum Padding {
		static let minimal: CGFloat = 4
		static let half: CGFloat = 8
		static let normal: CGFloat = 16
		static let double: CGFloat = 32
		static let biggest: CGFloat = 64
	}
	
	enum L { // swiftlint:disable:this type_name
		static let maxWidth: Percent = 90%
		static let width: Percent = 85%
		static let height: CGFloat = 80
	}
	
	enum M { // swiftlint:disable:this type_name
		static let maxWidth: Percent = 80%
		static let width: Percent = 70%
		static let height: CGFloat = 60
	}
	
	enum S { // swiftlint:disable:this type_name
		static let maxWidth: Percent = 60%
		static let width: CGFloat = 40
		static let height: CGFloat = 50
	}
}
