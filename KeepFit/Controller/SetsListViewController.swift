//
//  SetsListViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 13/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class SetsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PassGymSetDelegate {



    private struct Constants {
        static let addSetIdentifier = "addSet"
        static let setCellIdentifier = "setCell"
    }

    @IBOutlet weak var setsListTableView: UITableView!

    @IBOutlet weak var setsNavigationItem: UINavigationItem!
    
    var exerciseName: String!
    var trainingId: Int!
    var exercise: TrainingExercise!
    var training: Training!

    override func viewDidLoad() {
        super.viewDidLoad()
        setsListTableView.delegate = self
        setsListTableView.dataSource = self

        exercise = DBManager.sharedInstance.getExerciseForTraining(exerciseName: exerciseName, trainingId: trainingId)

        
    }

    override func viewWillAppear(_ animated: Bool) {


        setsListTableView.reloadData()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.sets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = setsListTableView.dequeueReusableCell(withIdentifier: Constants.setCellIdentifier, for: indexPath) as! SetTableViewCell
        cell.configureCell(with: exercise.sets[indexPath.row], exerciseName: exerciseName)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            setsListTableView.beginUpdates()
            let set = exercise.sets[indexPath.row]
            DBManager.sharedInstance.deleteObject(object: set)
            setsListTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            setsListTableView.endUpdates()

        }
    }
    


    @IBAction func addSet(_ sender: Any) {
        performSegue(withIdentifier: Constants.addSetIdentifier, sender: self)
    }

    func passData(gymSet: GymSet) {
        DBManager.sharedInstance.updateSetsForTrainingExercise(exerciseName: exerciseName, trainingId: trainingId, set: gymSet)        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.addSetIdentifier {
            let destinationVC = segue.destination as! GymSetViewController
            destinationVC.delegate = self
            destinationVC.exerciseName = exerciseName
        }
    }

}
