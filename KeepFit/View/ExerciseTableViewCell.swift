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
        setupUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(with exercise: Exercise) {
        
//        if let _url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let path = _url.appendingPathComponent(exercise.imagePath)
//            do {
//                let data = try Data(contentsOf: path)
//                exerciceImageView.image = UIImage(data: data)
//            }catch {
//                fatalError("Error")
//            }
//        }
        exerciseNameLabel.text = exercise.name
    }

    func setupUI(){

//        self.backgroundColor = UIColor(displayP3Red: 0.9569, green: 0.6157, blue: 0.5922, alpha: 1.0)



//        let backgroundImage = UIImage(named: "menuVCBg")
//        let backgoundImageView = UIImageView(image: backgroundImage)
//        backgoundImageView.contentMode = .scaleToFill
//        self.backgroundView = backgoundImageView

//        backgoundImageView.image = backgroundImage
//        backgoundImageView.contentMode = .scaleToFill
//        backgoundImageView.alpha = 0.5
//        menuCollectionView.backgroundView = backgoundImageView
    }

}

