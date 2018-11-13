//
//  AddExerciseViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 09/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit
import RealmSwift

class AddExerciseViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    private struct Constants {
        static let exrcisesListIdentifier = "exrcisesList"
        static let cellIdentifier = "cell"
    }

    @IBOutlet weak var trainingExercisesTableView: UITableView!
    @IBOutlet weak var trainingExercisesNavigationItem: UINavigationItem!

    var trainingId: Int!
    var training: Training!



    

    override func viewDidLoad() {
        super.viewDidLoad()

        training = DBManager.sharedInstance.getTrainingById(id: trainingId)
        trainingExercisesTableView.delegate = self
        trainingExercisesTableView.dataSource = self
        print(training.id)

        
    }

    override func viewWillAppear(_ animated: Bool) {
        trainingExercisesTableView.reloadData()
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return training.exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trainingExercisesTableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = training.exercises[indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            trainingExercisesTableView.beginUpdates()
            let exercise = training.exercises[indexPath.row]
            DBManager.sharedInstance.deleteObject(object: exercise)
            trainingExercisesTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            trainingExercisesTableView.endUpdates()
            

        }
    }

    @IBAction func addExercise(_ sender: Any) {
        performSegue(withIdentifier: Constants.exrcisesListIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.exrcisesListIdentifier {
            let destinationVC = segue.destination as! ExercisesListViewController
            destinationVC.trainingId = trainingId
        }
    }
    
    func setupUI() {
        

    }

}
