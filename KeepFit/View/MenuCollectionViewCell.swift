//
//  MenuCollectionViewCell.swift
//  KeepFit
//
//  Created by Levchuk Misha on 23/10/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    func configureCell(with cell: MenuItem) {
        self.cellImageView.image = cell.image
        self.cellLabel.text = cell.name
    }
    
}
