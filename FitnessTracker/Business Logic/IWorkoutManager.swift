//
//  IWorkoutManager.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 23.03.2023.
//
import Foundation

protocol IWorkoutManager {
	func allExercises() -> [Exercise]
	func getWorkoutOf(_ date: Date) -> [Exercise]
	func isExerciseExist(at date: Date) -> Bool
	func addExercise(exercise: Exercise)
	func addExercises(exercises: [Exercise])
}
