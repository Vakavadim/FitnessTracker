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
	func test_getWorkoutOfDate_withExerciseStub_shouldBeReturnNotEmptyArray() {
		let sut = makeSut()
		sut.addExercises(exercises: ExerciseStub.exercises)
	
		guard let newDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else {
			fatalError("Date is not exist")
		}
		let newExercise = Exercise(
			name: "TestExercise",
			workoutDescription: "Description",
			image: UIImage(),
			date: newDate
		)
		sut.addExercise(exercise: newExercise)
		
		let exercisesFromDate = sut.getWorkoutOf(newDate).filter {
			$0.date == newDate
		}
		
		XCTAssertFalse(
			exercisesFromDate.isEmpty,
			"Returned array with exercise of exact date should't be empty"
		)
	}
	
	func test_getWorkoutOfDate_withAddingExercise_shouldBeReturnEmptyArray() {
		let sut = makeSut()
		sut.addExercises(exercises: ExerciseStub.exercises)
	
		guard let newDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else {
			fatalError("Date is not exist")
		}
		let newExercise = Exercise(
			name: "TestExercise",
			workoutDescription: "Description",
			image: UIImage(),
			date: newDate
		)
		sut.addExercise(exercise: newExercise)
		
		let exercisesFromDate = sut.getWorkoutOf(newDate).filter { $0.date != newDate }
		
		XCTAssertTrue(
			exercisesFromDate.isEmpty,
			"Returned array without exercise of exact date should be empty"
		)
	}
	
	func test_getWorkoutOfDate_withAddingExercise_returnedArrayShouldContainAddedExercise() {
		let sut = makeSut()
		sut.addExercises(exercises: ExerciseStub.exercises)
		guard let newDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else {
			fatalError("Date is not exist")
		}
		let exerciseWithDate = Exercise(
			name: "TestExercise",
			workoutDescription: "Description",
			image: UIImage(),
			date: newDate
		)
		
		sut.addExercise(exercise: exerciseWithDate)
		
		XCTAssertTrue(
			sut.getWorkoutOf(newDate).contains { $0 === exerciseWithDate },
			"Returned array without exercise of exact date should be empty"
		)
	}
	
	// MARK: - isExerciseExistAtDate
	func test_isExerciseExistAtDate_withInitialState_ShouldReturneFalse() {
		let sut = makeSut()
		
		XCTAssertFalse(
			sut.isExerciseExist(at: Date()),
			"The function must return false when exercise isn't exist by date"
		)
	}
	
	func test_isExerciseExistAtDate_withExerciseWithDate_ShouldReturneTrue() {
		let sut = makeSut()
		
		guard let newDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else {
			fatalError("Date is not exist")
		}
		let exerciseWithDate = Exercise(
			name: "TestExercise",
			workoutDescription: "Description",
			image: UIImage(),
			date: newDate
		)
		
		sut.addExercise(exercise: exerciseWithDate)
		
		XCTAssertTrue(
			sut.isExerciseExist(at: newDate),
			"The function must return true when exercise is exist by date"
		)
	}
	
	func test_isExerciseExistAtDate_withExerciseStub_ShouldReturneTrue() {
		let sut = makeSut()
		sut.addExercises(exercises: ExerciseStub.exercises)
		let date = ExerciseStub.exercises[0].date
		
		XCTAssertTrue(
			sut.isExerciseExist(at: date),
			"The function must return true when exercise is exist by date"
		)
	}
	
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
