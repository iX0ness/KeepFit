//
//  ExerciseProbeViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 19.02.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class ExerciseProbeViewController: UIViewController {

    var point1: CGPoint!
    var point2: CGPoint!
    var point3: CGPoint!

    var probePhoto: UIImage?
    @IBOutlet weak var probeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        probeImageView.image = probePhoto

    }


    //first point
    @IBAction func handlePan1(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        point1 = CGPoint(x: (recognizer.view?.center.x)!, y: (recognizer.view?.center.y)!)
    }


    //second point
    @IBAction func handlePan2(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        point2 = CGPoint(x: (recognizer.view?.center.x)!, y: (recognizer.view?.center.y)!)

    }

    //third point
    @IBAction func handlePan3(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        point3 = CGPoint(x: (recognizer.view?.center.x)!, y: (recognizer.view?.center.y)!)

    }
    

    @IBAction func checkExercise(_ sender: Any) {
        let vectorCreator = PointManipulator(p1: point1, p2: point2, p3: point3)
        let vectors = vectorCreator.createVectors(p1: point1!, p2: point2!, p3: point3!)
        let manipulator = VectorManipulator(vector1: vectors[0], vector2: vectors[1])
        let dotProduct = Double(manipulator.getDotProduct())
        let cosAngle = dotProduct / (manipulator.vector1Abs * manipulator.vector2Abs)

        let alert = UIAlertController(title: "Photo Source", message: "Choose source", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.message = "\(cosAngle)"
        self.present(alert, animated: true, completion: nil)

    }

}
