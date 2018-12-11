//
//  Training.swift
//  KeepFit
//
//  Created by Levchuk Misha on 09/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift

class Training: Object {

    @objc dynamic var id = 0
    @objc dynamic var date = NSDate()
    var exercises = RealmSwift.List<TrainingExercise>()

    convenience init(date: NSDate, exercise: TrainingExercise) {
        self.init()
        self.exercises.append(exercise)
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}

