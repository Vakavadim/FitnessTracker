//
//  Colors.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 19.06.2023.
//

import UIKit

fileprivate enum FlatColor { // swiftlint:disable:this private_over_fileprivate
	enum Green {
		static let Fern = UIColor(hex: 0x6ABB72)
		static let MountainMeadow = UIColor(hex: 0x3ABB9D)
		static let ChateauGreen = UIColor(hex: 0x4DA664)
		static let PersianGreen = UIColor(hex: 0x2CA786)
	}

	enum Blue {
		static let CornflowerBlue = UIColor(hex: 0x7990C1)
		static let DarkSlateBlue = UIColor(hex: 0x2B3C60)
	}

	enum Purpure {
		static let DarkIndigo = UIColor(hex: 0x23233A)
		static let LiloGrey = UIColor(hex: 0x675F81)
	}

	enum Yellow {
		static let LemonChiffon = UIColor(hex: 0xFFFCD5)
		static let Goldenrod = UIColor(hex: 0xE2C46D)
	}

	enum Orange {
		static let NeonCarrot = UIColor(hex: 0xF79E3D)
		static let Mustard = UIColor(hex: 0xE2C46D)
	}

	enum Red {
		static let DustyRose = UIColor(hex: 0x976A6A)
		static let Valencia = UIColor(hex: 0xCC4846)
		static let Cinnabar = UIColor(hex: 0xDC5047)
		static let WellRead = UIColor(hex: 0xB33234)
	}

	enum Gray {
		static let SteelGray = UIColor(hex: 0x787878)
		static let SlateGray = UIColor(hex: 0x89899D)
	}
}

fileprivate enum Colors { // swiftlint:disable:this private_over_fileprivate
	static let red = UIColor.color(
		light: FlatColor.Purpure.LiloGrey,
		dark: FlatColor.Red.DustyRose
	)
	static let blue = UIColor.color(
		light: FlatColor.Blue.CornflowerBlue,
		dark: FlatColor.Blue.DarkSlateBlue
	)
	static let orange = UIColor.color(
		light: FlatColor.Orange.Mustard,
		dark: FlatColor.Gray.SteelGray
	)
	static let yellowAndDarkPurpure = UIColor.color(
		light: FlatColor.Yellow.LemonChiffon,
		dark: FlatColor.Purpure.DarkIndigo
	)
	static let white = UIColor.color(
		light: .white,
		dark: FlatColor.Gray.SlateGray
	)
}

enum Theme {
	static let accentColor = Colors.red
	static let backgroundColor = Colors.yellowAndDarkPurpure
	static let textFieldBackgroundColor = Colors.white
	static let blueButtonBackground = Colors.blue
	static let orangeButtonBackground = Colors.orange
}
