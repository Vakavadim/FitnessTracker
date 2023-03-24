//
//  FitnessTrackerTests.swift
//  FitnessTrackerTests
//
//  Created by Вадим Гамзаев on 09.03.2023.
//

import XCTest
@testable import FitnessTracker

final class WorkoutManagerTests: XCTestCase {
	
	// MARK: - allExercises
	func test_allExercises_initialState_shouldReturnEmptyArray() {
		let sut = makeSut()
		
		XCTAssertTrue(
			sut.allExercises().isEmpty,
			"Exercise array must be empty in initial state"
		)
	}
	
	// MARK: - getWorkoutOfDate
	
	// MARK: - isExerciseExistAtDate

	// MARK: - addExercise
	
	func test_addExercise_withAddedNewTask_shouldConteinNewTask() {
		let sut = makeSut()
		let exercise = ExerciseStub.exercises[0]
		
		sut.addExercise(exercise: exercise)
		
		XCTAssertTrue(
			sut.allExercises().contains { $0 === exercise },
			"Returned array must contain added exercise"
		)
	}
	
	func test_addExercise_withAddedNewTask_shouldIncreaseTheCounOfExercisesByOne() {
		let sut = makeSut()
		let exercise = ExerciseStub.exercises[0]
		
		let expectedExercisesCount = sut.allExercises().count + 1
		sut.addExercise(exercise: exercise)
		
		XCTAssertEqual(
			expectedExercisesCount,
			sut.allExercises().count,
			"The number or returned exercise should be equal expected exercises count"
		)
	}
	
	// MARK: - addExercises
	
	func test_addExercises_withAddedExercisesFromStub_shouldBeReturnEqualExercisesCount() {
		let sut = makeSut()
		let expectedExercisesCount = ExerciseStub.exercises.count
		
		sut.addExercises(exercises: ExerciseStub.exercises)
		
		XCTAssertEqual(
			expectedExercisesCount,
			sut.allExercises().count,
			"The number or returned exercise should be equal expected exercises count"
		)
	}
}

private extension WorkoutManagerTests {
	func makeSut() -> WorkoutManager {
		return WorkoutManager()
	}
}
