//
//  IAuthManager.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 15.06.2023.
//

import Foundation

protocol IAuthManager {
	func login(login: Login, password: Password)
	func register(login: Login, password: Password)
}
