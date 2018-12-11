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
        self.exercises = DBManager.sharedInstance.getExercisesFromDB()
        self.exerciseTableView.delegate = self
        self.exerciseTableView.dataSource = self
    }

    // MARK: -  Delegate and DataSource methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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

}
