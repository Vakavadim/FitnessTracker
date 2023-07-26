//
//  PasswordRecoveryModel.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 16.07.2023.
//

import Foundation

enum PasswordRecoveryModel {
	enum Request {
		case resetPass(Email)
	}

	struct Response {
		var result: Result<Email, Error>
	}

	enum ViewModel {
		case success(String)
		case error(String)
	}
}
