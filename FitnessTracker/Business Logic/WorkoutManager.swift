//
//  WorkoutManager.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 23.03.2023.
//

import Foundation

final class WorkoutManager: IWorkoutManager {
	private var exercises: [Exercise] = []
	
	func allExercises() -> [Exercise] {
		return exercises
	}
	
	func getWorkoutOf(_ date: Date) -> [Exercise] {
		return exercises.filter { $0.date == date }
	}
	
	func isExerciseExist(at date: Date) -> Bool {
		!exercises.filter { $0.date == date }.isEmpty
	}
	func addExercise(exercise: Exercise) {
		exercises.append(exercise)
	}
	
	func addExercises(exercises: [Exercise]) {
		self.exercises.append(contentsOf: exercises)
	}
}
