//
//  SetTableViewCell.swift
//  KeepFit
//
//  Created by Levchuk Misha on 15/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {
    @IBOutlet weak var repsLabel: UILabel!

    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var repsValueLabel: UILabel!

    @IBOutlet weak var timeValueLabel: UILabel!
    
    @IBOutlet weak var weightValueLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(with set: GymSet, exerciseName: String) {

        repsValueLabel.text = String(set.reps)
        timeValueLabel.text = String(set.time)
        weightValueLabel.text = String(set.kilos)

        if exerciseName == "Thruster" {
            timeLabel.isHidden = true
            timeValueLabel.isHidden = true
        }
    }

}
