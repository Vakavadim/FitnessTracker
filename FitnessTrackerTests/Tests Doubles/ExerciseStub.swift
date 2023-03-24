//
//  ExerxiseStub.swift
//  FitnessTrackerTests
//
//  Created by Вадим Гамзаев on 24.03.2023.
//

import UIKit
@testable import FitnessTracker

enum ExerciseStub {
	static let exercises = [
			StretchingExercise(
				timeInterval: WorkoutTimeInterval(200.0),
				name: "Yoga",
				workoutDescription: "workoutDescription",
				image: UIImage(),
				date: Date()
			),
			GymExercise(
				exerciseType: .chest,
				weight: 56.5,
				setsCount: 4,
				repetitions: 8,
				name: "Pushups",
				workoutDescription: "workoutDescription",
				image: UIImage(),
				date: Date()
			),
			CardioExercise(
				timeInterval: WorkoutTimeInterval(350.0),
				distances: Distances(2000.0),
				name: "Run",
				workoutDescription: "workoutDescription",
				image: UIImage(),
				date: Date()
			),
			GymExercise(
				exerciseType: .arms,
				weight: 56.5,
				setsCount: 4,
				repetitions: 8,
				name: "Pushups",
				workoutDescription: "workoutDescription",
				image: UIImage(),
				date: Date()
			),
			GymExercise(
				exerciseType: .legs,
				weight: 56.5,
				setsCount: 4,
				repetitions: 8,
				name: "Pushups",
				workoutDescription: "workoutDescription",
				image: UIImage(),
				date: Date()
			)
		]
	}
