//
//  GymSet.swift
//  KeepFit
//
//  Created by Levchuk Misha on 09/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift

class GymSet: Object {

    @objc dynamic var reps: Int = 0
    @objc dynamic var kilos: Double = 0
    @objc dynamic var time: String = ""

}
