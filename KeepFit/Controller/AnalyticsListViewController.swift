//
//  AnalyticsListViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 17/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit
import RealmSwift

class AnalyticsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private struct Constants {
        static let exerciseCellIdentifier = "exerciseCell"
        static let analyticsIdentifier = "analytics"
    }

    @IBOutlet weak var analyticsTableView: UITableView!
    var selectedExercise: String!

    var exercises: Results<Exercise>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercises = DBManager.sharedInstance.getExercisesFromDB()
        analyticsTableView.delegate = self
        analyticsTableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = analyticsTableView.dequeueReusableCell(withIdentifier: Constants.exerciseCellIdentifier, for: indexPath) as! ExerciseTableViewCell
        cell.configure(with: exercises[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedExercise = exercises[indexPath.row].name
        performSegue(withIdentifier: Constants.analyticsIdentifier, sender: self)

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.analyticsIdentifier {
            let destinationVC = segue.destination as! AnalyticsViewController
            destinationVC.exerciseName = selectedExercise
        }
    }

}
