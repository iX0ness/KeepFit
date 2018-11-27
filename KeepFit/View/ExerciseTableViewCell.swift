//
//  ExerciseTableViewCell.swift
//  KeepFit
//
//  Created by Levchuk Misha on 15.02.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var exerciceImageView: UIImageView!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    func configure(with exercise: Exercise) {
        
        if let _url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let path = _url.appendingPathComponent(exercise.imagePath)
            do {
                let data = try Data(contentsOf: path)
                exerciceImageView.image = UIImage(data: data)
            }catch {
                fatalError("SHLYAPA")
            }
        }
    }

}
