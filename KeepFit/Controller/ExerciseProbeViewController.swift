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

    



}
