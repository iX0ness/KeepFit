//
//  MenuViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 23/10/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private struct Constants {
        static let menuCellIdentifier = "menuCell"
        static let exerciseProbeIdentifier = "exerciseProbe"
        static let probeImage = "probe"
    }

    var menu = [MenuCell]()
    
    let exerciseProbe = MenuCell(image: UIImage(named: Constants.probeImage)!, name: "Probe")


    @IBOutlet weak var menuCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menu = [exerciseProbe]

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.menuCellIdentifier, for: indexPath) as! MenuCollectionViewCell
        cell.configureCell(with: menu[indexPath.row])
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            performSegue(withIdentifier: Constants.exerciseProbeIdentifier, sender: self)
        default:
            break
        }
    }


    

}
