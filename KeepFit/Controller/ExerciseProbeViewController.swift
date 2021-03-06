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
    var exerciseName: String!
    @IBOutlet weak var probeImageView: UIImageView!
    
    @IBOutlet weak var checkMeButton: UIButton!
    @IBOutlet weak var firstPoint: UIImageView!
    @IBOutlet weak var secondPoint: UIImageView!
    @IBOutlet weak var thirdPoint: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        probeImageView.image = probePhoto

    }

    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }


    //first point
    @IBAction func handlePan1(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)

        let point = AnglePoint(rawValue: (recognizer.view?.tag)!)

        switch point?.rawValue {
        case 1:
            point1 = CGPoint(x: (recognizer.view?.center.x)!, y: (recognizer.view?.center.y)!)
        case 2:
            point2 = CGPoint(x: (recognizer.view?.center.x)!, y: (recognizer.view?.center.y)!)
        case 3:
            point3 = CGPoint(x: (recognizer.view?.center.x)!, y: (recognizer.view?.center.y)!)
        default: break

        }
    }

    @IBAction func checkExercise(_ sender: Any) {
        let vectorCreator = PointManipulator(p1: point1, p2: point2, p3: point3)
        let vectors = vectorCreator.createVectors(p1: point1!, p2: point2!, p3: point3!)
        let manipulator = VectorManipulator(vector1: vectors[0], vector2: vectors[1])
        let dotProduct = Double(manipulator.getDotProduct())
        let cosAngle = dotProduct / (manipulator.vector1Abs * manipulator.vector2Abs)

        let result = probeResult(cosAngle: cosAngle, exerciseName: exerciseName)
        print(cosAngle)

        let alert = UIAlertController(title: "Result", message: "\(result)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)

    }


    func probeResult(cosAngle: Double, exerciseName: String) -> String{

        switch exerciseName {

        case "Snatch":
            if cosAngle > -1 && cosAngle < -0.9962 {
                return "OK"
            } else {
                return "WRONG"
            }

        case "Thruster":
            if cosAngle > -1 && cosAngle < -0.9962 {
                return "OK"
            } else {
                return "WRONG"
            }
        case "Ringdip":
            if cosAngle > 0 && cosAngle < 0.9998 {
                return "OK"

            } else {
                return "WRONG"
            }
        case "Burpee":
            if cosAngle > 0.1736 && cosAngle < 0.9998 {
                return "OK"
            } else {
                return "WRONG"
            }

        case "Push Up":
            if cosAngle > 0 && cosAngle < 0.9998 {
                return "OK"

            } else {
                return "WRONG"
            }
        case "Back Squat":
            if cosAngle > 0 && cosAngle < 0.9998 {
                return "OK"

            } else {
                return "WRONG"
            }
        default:
            break
        }

        return ""
    }

    func setupUI() {
        self.view.backgroundColor = UIColor(displayP3Red: 0.8745, green: 0.0, blue: 0.0706, alpha: 1)
        
    }

}
