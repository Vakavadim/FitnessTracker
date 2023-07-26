//
//  ExercisesModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 24.07.2023.
//

import Foundation

enum ExercisesModel {
	enum Request {
		case someCase
	}

	struct Response {
		var result: String
	}

	enum ViewModel {
		case success(String)
		case error(String)
	}
}
