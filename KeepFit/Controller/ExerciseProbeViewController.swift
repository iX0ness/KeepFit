//
//  ExerciseProbeViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 19.02.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class ExerciseProbeViewController: UIViewController {

    
    var probePhoto: UIImage?
    @IBOutlet weak var probeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        probeImageView.image = probePhoto

    }

    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        print(recognizer.view?.center)
    }

    



}
