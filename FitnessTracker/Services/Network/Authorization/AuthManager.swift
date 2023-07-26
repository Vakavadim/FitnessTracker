//
//  AuthManager.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 15.06.2023.
//

import Foundation
import Firebase

enum AuthError: Error {
	case userDataNotFound
}

final class AuthManager: IAuthManager {
	func login(email: Email, password: Password, completion: @escaping (AuthResult) -> Void) {
		Auth.auth().signIn(withEmail: email.rawValue, password: password.rawValue) { authResult, error in
			if let error = error {
				completion(AuthResult.failure(error))
			} else if let user = authResult?.user {
				let firebaseUser = User(
					uid: user.uid,
					name: Name(user.displayName ?? ""),
					email: email
				)
				completion(AuthResult.success(firebaseUser))
			}
		}
	}

	func register(
		name: Name,
		email: Email,
		password: Password,
		completion: @escaping (AuthResult) -> Void
	) {
		Auth.auth().createUser(
			withEmail: email.rawValue,
			password: password.rawValue
		) { authResult, error in
			if let error = error {
				completion(AuthResult.failure(error))
				return
			}
			guard let user = authResult?.user else {
				completion(AuthResult.failure(AuthError.userDataNotFound))
				return
			}
			
			let changeRequest = user.createProfileChangeRequest()
			changeRequest.displayName = name.rawValue
			changeRequest.commitChanges()
			
			Auth.auth().currentUser?.sendEmailVerification()
			
			let firebaseUser = User(
				uid: user.uid,
				name: Name(user.displayName ?? ""),
				email: Email(user.email ?? "")
			)
			completion(AuthResult.success(firebaseUser))
		}
	}

	func resetPassword(email: Email, completion: @escaping (Result<Email, Error>) -> Void) {
		Auth.auth().sendPasswordReset(withEmail: email.rawValue) { error in
			if let error = error {
				completion(.failure(error))
			} else {
				completion(.success(email))
			}
		}
	}
}
