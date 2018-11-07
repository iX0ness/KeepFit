//
//  Exercise.swift
//  KeepFit
//
//  Created by Levchuk Misha on 15.02.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Exercise: Object {

    @objc dynamic var name = ""
    @objc dynamic var imagePath = ""

    override class func primaryKey() -> String? {
        return "name"
    }

    convenience init(name: String, imagePath: String) {
        self.init()
        self.name = name
        self.imagePath = imagePath
    }
}


