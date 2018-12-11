//
//  DBManager.swift
//  KeepFit
//
//  Created by Levchuk Misha on 06/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift

//let thruster = Exercise(name: "Thruster", imagePath: UIImage(named: "thruster")?.saveInLocalStorage(imageName: "Thruster") ?? "")
//let snatch = Exercise(name: "Snatch", imagePath: UIImage(named: "snatch")?.saveInLocalStorage(imageName: "Snatch") ?? "")
//let ringdip = Exercise(name: "Ringdip", imagePath: UIImage(named: "ringdip")?.saveInLocalStorage(imageName: "Ringdip") ?? "")
//let burpee = Exercise(name: "Burpee", imagePath: UIImage(named: "burpee")?.saveInLocalStorage(imageName: "Burpee") ?? "")
//let running = Exercise(name: "Running", imagePath: UIImage(named: "running")?.saveInLocalStorage(imageName: "Running") ?? "")
//let backsquat = Exercise(name: "Back Squat", imagePath: UIImage(named: "backsquat")?.saveInLocalStorage(imageName: "BackSquat") ?? "")
//let frontsquat = Exercise(name: "Front Squat", imagePath: UIImage(named: "frontsquat")?.saveInLocalStorage(imageName: "FrontSquat") ?? "")
//let cleanjerk = Exercise(name: "Clean&Jerk", imagePath: UIImage(named: "cleanjerk")?.saveInLocalStorage(imageName: "CleanJerk") ?? "")
//let clean = Exercise(name: "Clean", imagePath: UIImage(named: "clean")?.saveInLocalStorage(imageName: "Clean") ?? "")
//let pushPress = Exercise(name: "Push Press", imagePath: UIImage(named: "pushpress")?.saveInLocalStorage(imageName: "PushPress") ?? "")
//let jerk = Exercise(name: "Jerk", imagePath: UIImage(named: "jerk")?.saveInLocalStorage(imageName: "Jerk") ?? "")
//let pushUp = Exercise(name: "Push Up", imagePath: UIImage(named: "pushup")?.saveInLocalStorage(imageName: "PushUp") ?? "")
//let pullUp = Exercise(name: "Pull Up", imagePath: UIImage(named: "pullup")?.saveInLocalStorage(imageName: "PullUp") ?? "")
//let muscleUP = Exercise(name: "Muscle Up", imagePath: UIImage(named: "muscleup")?.saveInLocalStorage(imageName: "MuscleUp") ?? "")
//let benchPress = Exercise(name: "Bench Press", imagePath: UIImage(named: "benchpress")?.saveInLocalStorage(imageName: "BenchPress") ?? "")

class DBManager {

    private struct Constants {
        static let thruster = "Thruster"
        static let snatch = "Snatch"
        static let ringdip = "Ringdip"
        static let burpee = "Burpee"
        static let running = "Running"
        static let backsquat = "Backsquat"
        static let frontsquat = "Frontsquat"
        static let cleanjerk = "Clean&Jerk"
        static let clean = "Clean"
        static let pushPress = "PushPress"
        static let jerk = "Jerk"
        static let pushUp = "PushUp"
        static let pullUp = "PullUp"
        static let muscleUP = "MuscleUp"
        static let benchPress = "BenchPress"

    }

    private var database: Realm
    static let sharedInstance = DBManager()

    private init() {
        database = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }


    func saveObjectInDB<T: Object>(_ model: T, completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        do {
            try database.write {
                database.add(model, update: false)
                completion()
            }
        } catch let error {
            failure(error.localizedDescription)
        }
    }

    func populateDB(_ model: Exercise){
        do {
            try database.write {
                database.add(model, update: true)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func addExerciseForTraining(trainingId: Int, exercise: TrainingExercise) {

        let training = getTrainingById(id: trainingId)


        try? database.write {
            training.exercises.append(exercise)
        }

        try! database.write {
            database.add(training, update: true)
        }
    }


    func addSetsForTrainingExercise(exerciseName: String, trainingId: Int, set: GymSet) {

        let training = getTrainingById(id: trainingId)
        let result = training.exercises.filter("name contains '\(exerciseName)'")
        if let exercise = result.first {
            try! database.write {
                exercise.sets.append(set)
            }

            try! database.write {
                database.add(training, update: true)
            }
        }
    }

    func getExerciseForTraining(exerciseName: String, trainingId: Int) -> TrainingExercise? {
        let training = getTrainingById(id: trainingId)
        let result = training.exercises.filter("name contains '\(exerciseName)'")
        if let exercise = result.first {
            return exercise
        }
        return nil

    }

    func getTrainingsFromDB() -> Results<Training> {
        let results: Results<Training> = database.objects(Training.self)
        return results
    }

    func getTrainingById(id: Int) -> Training {
        let training = database.object(ofType: Training.self, forPrimaryKey: id)

        return training!
    }

    func getExercisesFromDB() -> Results<Exercise> {
        let results: Results<Exercise> = database.objects(Exercise.self)
        return results
    }

    func getStatisticForExerciseResults(year: Int, exerciseName: String) -> [(String, Double)] {
        let trainings = database.objects(Training.self).sorted(byKeyPath: "date", ascending: true)


        let trainingsFilteredByYear = trainings.filter {
            return Calendar.current.component(.year, from: $0.date as Date) == year
        }

        let janTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 1
        }

        let febTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 2
        }

        let marchTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 3
        }

        let aprTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 4
        }

        let mayTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 5
        }

        let juneTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 6
        }

        let julyTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 7
        }

        let augTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 8
        }

        let sepTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 9
        }

        let octTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 10
        }

        let novTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 11
        }

        let decTrainings = trainingsFilteredByYear.filter { (training) -> Bool in
            return Calendar.current.component(.month, from: training.date as Date) == 12
        }


        let maxJanuary = findBestResult(trainings: janTrainings, exerciseName: exerciseName)
        let maxFebruary = findBestResult(trainings: febTrainings, exerciseName: exerciseName)
        let maxMarch = findBestResult(trainings: febTrainings, exerciseName: exerciseName)
        let maxApril = findBestResult(trainings: aprTrainings, exerciseName: exerciseName)
        let maxMay = findBestResult(trainings: mayTrainings, exerciseName: exerciseName)
        let maxJune = findBestResult(trainings: juneTrainings, exerciseName: exerciseName)
        let maxJuly = findBestResult(trainings: julyTrainings, exerciseName: exerciseName)
        let maxAugust = findBestResult(trainings: augTrainings, exerciseName: exerciseName)
        let maxSeptember = findBestResult(trainings: sepTrainings, exerciseName: exerciseName)
        let maxOctober = findBestResult(trainings: octTrainings, exerciseName: exerciseName)
        let maxNovember = findBestResult(trainings: novTrainings, exerciseName: exerciseName)
        let maxDecember = findBestResult(trainings: decTrainings, exerciseName: exerciseName)


        var resultsDictionary = [String: Double]()

        let january = ("January", maxJanuary)
        let february = ("February", maxFebruary)
        let march = ("March", maxMarch)
        let april = ("April", maxApril)
        let may = ("May", maxMay)
        let june = ("June", maxJune)
        let july = ("July", maxJuly)
        let august = ("August", maxAugust)
        let september = ("September", maxSeptember)
        let october = ("October", maxOctober)
        let november = ("November", maxNovember)
        let december = ("December", maxDecember)

        resultsDictionary.updateValue(maxJanuary, forKey: "January")
        resultsDictionary.updateValue(maxFebruary, forKey: "February")
        resultsDictionary.updateValue(maxMarch, forKey: "March")
        resultsDictionary.updateValue(maxApril, forKey: "April")
        resultsDictionary.updateValue(maxMay, forKey: "May")
        resultsDictionary.updateValue(maxJune, forKey: "June")
        resultsDictionary.updateValue(maxJuly, forKey: "July")
        resultsDictionary.updateValue(maxAugust, forKey: "August")
        resultsDictionary.updateValue(maxSeptember, forKey: "September")
        resultsDictionary.updateValue(maxOctober, forKey: "October")
        resultsDictionary.updateValue(maxNovember, forKey: "November")
        resultsDictionary.updateValue(maxDecember, forKey: "December")


        let resultsArray = [january, february, march, april, may, june, july, august, september, october, november, december]

        return resultsArray
    }

    func deleteObject(object: Object) {
        try? database.write {
            database.delete(object)
        }
    }

    func incrementID() -> Int {
        return (database.objects(Training.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }

    func findBestResult(trainings: LazyFilterCollection<LazyFilterCollection<Results<Training>>>?, exerciseName: String) -> Double {

        var exercisesToAdd = [TrainingExercise]()
        var kilosToAdd = [Double]()
        var repsToAdd = [Int]()



        if let trainingsToCheck = trainings {
            for training in trainingsToCheck {
                if training.exercises.count > 0 {
                    for exercise in training.exercises {
                        if exercise.name == exerciseName {
                            exercisesToAdd.append(exercise)
                        }
                    }
                } else {
                    return 0.0
                }
            }

            if exerciseName == Constants.snatch || exerciseName == Constants.thruster {
                for exercise in exercisesToAdd {

                    if exercise.sets.count > 0 {
                        for set in exercise.sets {
                            kilosToAdd.append(set.kilos)
                        }
                    } else {
                        print("Exercise has no sets")
                        kilosToAdd.append(0.0)
                    }

                }
            } else if exerciseName == Constants.burpee || exerciseName == Constants.ringdip {
                for exercise in exercisesToAdd {
                    if exercise.sets.count > 0 {
                        for set in exercise.sets {
                            repsToAdd.append(set.reps)
                        }
                    } else {
                        print("Exercise has no sets")
                        repsToAdd.append(0)
                    }
                }
            } else {
                print("zalupa")
            }


            if kilosToAdd.count == 0 && repsToAdd.count == 0 {
                return 0.0
            }

            if kilosToAdd.isEmpty {
                return Double(repsToAdd.max()!)
            }

            return kilosToAdd.max()!

        } else {
            return 0.0
        }

    }

}

extension UIImage {
    func saveInLocalStorage(imageName: String) -> String? {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("\(imageName).jpg")

            guard !FileManager.default.fileExists(atPath: fileURL.absoluteString) else {
                return nil
            }

            guard let data = self.jpegData(compressionQuality: 1.0) ?? self.pngData() else {
                return nil
            }
            try data.write(to: fileURL)
            return "\(imageName).jpg"
        } catch { }
        return nil
    }
}
