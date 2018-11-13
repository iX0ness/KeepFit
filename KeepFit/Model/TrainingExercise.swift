//
//  TrainingExercise.swift
//  KeepFit
//
//  Created by Levchuk Misha on 09/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift

class TrainingExercise: Object {

    @objc dynamic var name: String = ""
    let sets = RealmSwift.List<GymSet>()
    //var training = LinkingObjects(fromType: Training.self, property: "exercises")


    convenience init(name: String, gymSet: GymSet) {
        self.init()
        self.name = name
        self.sets.append(gymSet)
    }

//    override class func primaryKey() -> String? {
//        return "name"
//    }
}
