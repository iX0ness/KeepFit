//
//  ExercisesListViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 09/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit
import RealmSwift

class ExercisesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private struct Constants {
        static let exerciseCellIdentifier = "exerciseCell2"
        static let exerciseInfoIdentifier = "exerciseInfo"
    }

    @IBOutlet weak var exercisesTableView: UITableView!
    var exercises: Results<Exercise>!
    var exerciseName: String!
    var trainingId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
        self.exercises = DBManager.sharedInstance.getExercisesFromDB()
        print(trainingId)

        // Do any additional setup after loading the view.
    }

//    override func viewDidAppear(_ animated: Bool) {
//        exercisesTableView.reloadData()
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  exercisesTableView.dequeueReusableCell(withIdentifier: Constants.exerciseCellIdentifier, for: indexPath) as! ExerciseTableViewCell
        cell.configure(with: exercises[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exerciseName = exercises[indexPath.row].name
        let exercise = TrainingExercise()
        exercise.name = exerciseName
        
        DBManager.sharedInstance.addExerciseForTraining(trainingId: trainingId, exercise: exercise)
        

    }

}