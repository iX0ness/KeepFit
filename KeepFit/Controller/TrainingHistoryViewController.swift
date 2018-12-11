//
//  TrainingHistoryViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 07/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit
import RealmSwift

class TrainingHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private struct Constants {
        static let trainingExercisesIdentifier = "trainingExercises"
    }

    @IBOutlet weak var trainingHistoryTableView: UITableView!
    var trainings: Results<Training>!
    var trainingId: Int!


    override func viewDidLoad() {
        super.viewDidLoad()

        trainings = DBManager.sharedInstance.getTrainingsFromDB()
        trainingHistoryTableView.delegate = self
        trainingHistoryTableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trainingHistoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = formatDate(date: trainings[indexPath.row].date)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        trainingId = trainings[indexPath.row].id
        performSegue(withIdentifier: Constants.trainingExercisesIdentifier, sender: self)
        
    }
    
    @IBAction func addTraining(_ sender: Any) {
        let training = Training()

        if trainings.last == nil {
            try! DBManager.sharedInstance.saveObjectInDB(training, completion: {
                print("Training added to DB")
            }, failure: { (error) in
                print(error)
            })
            trainingHistoryTableView.reloadData()
        } else {
            training.id = DBManager.sharedInstance.incrementID()
            try! DBManager.sharedInstance.saveObjectInDB(training, completion: {
                print("Training added to DB")
            }, failure: { (error) in
                print(error)
            })
            trainingHistoryTableView.reloadData()
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.trainingExercisesIdentifier {
            let destinationVC = segue.destination as! AddExerciseViewController
            destinationVC.trainingId = trainingId
        }

    }

    func formatDate(date: NSDate) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let stringDate: String = dateFormatter.string(from: date as Date)
        return stringDate
    }

    

}
