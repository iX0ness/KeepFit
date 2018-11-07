//
//  ExerciseViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 15.02.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit
import RealmSwift

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private struct Constants {
        static let exerciseCellIdentifier = "exerciseCell"
        static let exerciseProbeIdentifier = "exerciseProbe"
        static let photoTakeIdentifier = "photoTake"
        static let backgoundImage = "bg.png"
        static let shadowImage = "draws.png"
    }

    @IBOutlet weak var exerciseTableView: UITableView!




    var exercises: Results<Exercise>!
    var selectedExercise: Exercise?


    override func viewDidLoad() {
        super.viewDidLoad()
        saveExcercises {
            self.exercises = DBManager.sharedInstance.getDataFromDB()
            self.exerciseTableView.delegate = self
            self.exerciseTableView.dataSource = self
        }
        setupUI()


    }

    // MARK: -  Delegate and DataSource methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  exerciseTableView.dequeueReusableCell(withIdentifier: Constants.exerciseCellIdentifier, for: indexPath) as! ExerciseTableViewCell
        cell.configure(with: exercises[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exerercise = exercises[indexPath.row]
        selectedExercise = exerercise
        performSegue(withIdentifier: Constants.photoTakeIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.photoTakeIdentifier {
            let destinationVC = segue.destination as! PhotoViewController
            destinationVC.exerciseName = selectedExercise?.name
        }


    }

    func setupUI() {
//        exerciseTableView.backgroundView = UIImageView(image: UIImage(named: Constants.backgoundImage))
//        exerciseTableView.contentMode = .scaleToFill
//        exerciseTableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
//        navigationController?.navigationBar.barStyle = .default
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage(named: Constants.shadowImage)

    }

    private func saveExcercises(completion: @escaping () -> ()) {
        let thruster = Exercise(name: "Thruster", imagePath: UIImage(named: "thruster")?.saveInLocalStorage(imageName: "Thruster") ?? "")
        let snatch = Exercise(name: "Snatch", imagePath: UIImage(named: "snatch")?.saveInLocalStorage(imageName: "Snatch") ?? "")
        let ringdip = Exercise(name: "Ringdip", imagePath: UIImage(named: "ringdip")?.saveInLocalStorage(imageName: "Ringdip") ?? "")
        let burpee = Exercise(name: "Burpee", imagePath: UIImage(named: "burpee")?.saveInLocalStorage(imageName: "Burpee") ?? "")

        DBManager.sharedInstance.saveObjectInDB(thruster, completion: {
            print("Thruster successfully added to DB")
            completion()
        }) { (error) in
            print(error)
        }

        DBManager.sharedInstance.saveObjectInDB(snatch, completion: {
            print("Snatch successfully added to DB")
            completion()
        }) { (error) in
            print(error)
        }

        DBManager.sharedInstance.saveObjectInDB(ringdip, completion: {
            print("Ringdip successfully added to DB")
            completion()
        }) { (error) in
            print(error)
        }

        DBManager.sharedInstance.saveObjectInDB(burpee, completion: {
            print("Burpee successfully added to DB")
            completion()
        }) { (error) in
            print(error)
        }
    }





}
