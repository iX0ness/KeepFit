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
    @IBOutlet weak var navItem: UINavigationItem!
    
    
    var exercises: Results<Exercise>!
    var selectedExercise: Exercise?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.exercises = DBManager.sharedInstance.getExercisesFromDB()
        self.exerciseTableView.delegate = self
        self.exerciseTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        setupUI()
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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(displayP3Red: 0.898, green: 0.1059, blue: 0.1059, alpha: 0.8)

    }

    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0.898, green: 0.1059, blue: 0.1059, alpha: 0.4)
        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 0, green: 0.9804, blue: 0.5725, alpha: 1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 0, green: 0.9804, blue: 0.5725, alpha: 1.0)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

    }

}
