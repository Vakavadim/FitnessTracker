//
//  MaskStringConvertible.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 11.06.2023.
//

import Foundation

protocol MaskStringConvertible: CustomStringConvertible, CustomDebugStringConvertible { }

extension MaskStringConvertible {
	var description: String {
		"***********"
	}

	var debugDescription: String {
		"***********"
	}
}
