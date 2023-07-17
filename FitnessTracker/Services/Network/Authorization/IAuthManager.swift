//
//  IAuthManager.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 15.06.2023.
//

import Foundation

protocol IAuthManager {
	func login(email: Email, password: Password, completion: @escaping (AuthResult) -> Void)
	func register(name: Name, email: Email, password: Password, completion: @escaping (AuthResult) -> Void)
	func resetPassword(email: Email, password: Password, completion: @escaping (AuthResult) -> Void)
}
