//
//  Exercise.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 22.03.2023.
//

import UIKit

/// WorkoutTimeInterval is a structure that performs the functions of the standard TimeInterval.
/// Stores the number of seconds in the Double type. Implements the CustomStringConvertible protocol.
struct WorkoutTimeInterval: CustomStringConvertible {
	let rawValue: Double
	
	init(_ rawValue: Double) {
		self.rawValue = rawValue
	}
	
	var description: String {
		let hours = Int(rawValue / 60 / 60)
		let minutes = Int(rawValue) / 60 % 60
		let seconds = Int(rawValue) % 60
		return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
	}
}

/// Distances structure is a Simple wrapper designed to store distance information in meters.
/// Implements the CustomStringConvertible protocol.
struct Distances: CustomStringConvertible {
	let rawValue: Double
	
	init(_ rawValue: Double) {
		self.rawValue = rawValue
	}
	
	var description: String {
		let kilometers = Int(rawValue) / 1000
		let metrs = Int(rawValue) % 1000
		return String(format: "%2d,%2d km", kilometers, metrs)
	}
}

/// Exercise is a base class of exercise which include basic parameters.
class Exercise {
	var date: Date
	var name: String
	var workoutDescription: String
	var image: UIImage
	
	init(name: String, workoutDescription: String, image: UIImage, date: Date) {
		self.name = name
		self.workoutDescription = workoutDescription
		self.image = image
		self.date = date
	}
}

/// StretchingExercise is a class designed to provide stretching exercise include parameters of time.
class StretchingExercise: Exercise {
	var timeInterval: WorkoutTimeInterval
	
	init(
		timeInterval: WorkoutTimeInterval,
		name: String,
		workoutDescription: String,
		image: UIImage,
		date: Date
	) {
		self.timeInterval = timeInterval
		super.init(
			name: name,
			workoutDescription: workoutDescription,
			image: image,
			date: date
		)
	}
}

/// CardioExercise is a class designed to provide cardio exercise include parameters of distances and time.
class CardioExercise: Exercise {
	var timeInterval: WorkoutTimeInterval
	var distances: Distances
	
	init(
		timeInterval: WorkoutTimeInterval,
		distances: Distances,
		name: String,
		workoutDescription: String,
		image: UIImage,
		date: Date
	) {
		self.timeInterval = timeInterval
		self.distances = distances
		super.init(
			name: name,
			workoutDescription: workoutDescription,
			image: image,
			date: date
		)
	}
}

/// GymExercise is a class of exercises that includes work with gym equipment and weights.
/// Includes parameters for weight, number of sets, and number of reps per set.
class GymExercise: Exercise {
	enum GymExerciseType {
		case arms
		case legs
		case shoulders
		case chest
		case back
		case abs
	}
	
	var exerciseType: GymExerciseType
	var weight: Double
	var setsCount: Int
	var repetitions: Int
	
	init(
		exerciseType: GymExerciseType,
		weight: Double,
		setsCount: Int,
		repetitions: Int,
		name: String,
		workoutDescription: String,
		image: UIImage,
		date: Date
	) {
		self.exerciseType = exerciseType
		self.weight = weight
		self.setsCount = setsCount
		self.repetitions = repetitions
		super.init(
			name: name,
			workoutDescription: workoutDescription,
			image: image,
			date: date
		)
	}
}
