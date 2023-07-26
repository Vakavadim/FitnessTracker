//
//  MainModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 20.07.2023.
//

import Foundation

enum MainModel {
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
