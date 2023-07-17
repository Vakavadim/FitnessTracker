//
//  AuthResult.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 17.07.2023.
//

import Foundation

enum AuthResult {
	case failure(Error)
	case success(User)
}
