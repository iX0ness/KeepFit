//
//  PointManipulator.swift
//  KeepFit
//
//  Created by Levchuk Misha on 22.10.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import UIKit

class PointManipulator {
    
    var point1: CGPoint
    var point2: CGPoint
    var point3: CGPoint

    init(p1: CGPoint, p2: CGPoint, p3: CGPoint) {
        point1 = p1
        point2 = p2
        point3 = p3
    }

    func createVectors(p1: CGPoint, p2: CGPoint, p3: CGPoint) -> [CGVector] {
        let vector1 = CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)
        let vector2 = CGVector(dx: p2.x - p3.x, dy: p2.y - p3.y)

        return [vector1, vector2]
    }
}

