//
//  DBManager.swift
//  KeepFit
//
//  Created by Levchuk Misha on 06/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {

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

    func updateSetsForTrainingExercise(exerciseName: String, trainingId: Int, set: GymSet) {

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

    func deleteObject(object: Object) {
        try? database.write {
            database.delete(object)
        }
    }

    func incrementID() -> Int {
        return (database.objects(Training.self).max(ofProperty: "id") as Int? ?? 0) + 1
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
