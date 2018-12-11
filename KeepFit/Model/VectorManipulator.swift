//
//  VectorManipulator.swift
//  KeepFit
//
//  Created by Levchuk Misha on 20.10.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class VectorManipulator {

    var vector1: CGVector
    var vector2: CGVector

    var vector1Abs: Double {
        return sqrt(Double(vector1.dx * vector1.dx) + Double(vector1.dy * vector1.dy))
    }

    var vector2Abs: Double {
        return sqrt(Double(vector2.dx * vector2.dx) + Double(vector2.dy * vector2.dy))
    }

    init(vector1: CGVector, vector2: CGVector) {
        self.vector1 = vector1
        self.vector2 = vector2
    }

    func getDotProduct() -> CGFloat {
        return vector1.dx * vector2.dx + vector1.dy * vector2.dy
    }

}



