//
//  GymSetViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 10/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

protocol PassGymSetDelegate {
    func passData(gymSet: GymSet)
}

class GymSetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var kilosTextField: UITextField!

    @IBOutlet weak var timePicker: UIPickerView!

    var delegate: PassGymSetDelegate?

    var exerciseName: String!
    var time: String?

    let pickerData = [["00","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"], ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"], ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.delegate = self
        timePicker.dataSource = self
        //exerciseNameLabel.text = exerciseName


    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        var hours = pickerData[0][pickerView.selectedRow(inComponent: 0)]
        var minutes = pickerData[1][pickerView.selectedRow(inComponent: 1)]
        var seconds = pickerData[2][pickerView.selectedRow(inComponent: 2)]



        time = formatDate(date: "\(hours)\(minutes)\(seconds)")


    }
    

    @IBAction func addSet(_ sender: UIButton) {
        let set = GymSet()
        guard let repsInput = repsTextField.text, let kilosInput = kilosTextField.text else {return}
        guard let reps = Int(repsInput), let kilos = Double(kilosInput) else {return}
        //guard let time = formatDate(date: timeInput) else {return}

        set.reps = reps
        set.kilos = kilos
        guard let selectedTime = time else {return}
        set.time = selectedTime

        print(set.reps, set.kilos, set.time)


        if sender.isTouchInside {
            repsTextField.text = ""
            kilosTextField.text = ""
            //timeTextField.text = ""
        }

        delegate?.passData(gymSet: set)





    }


    func formatDate(date: String?) -> String? {
        guard let date = date else {return nil}

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHMMSS"
        guard let _date = dateFormatter.date(from: date) else {
            return nil
        }

        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "HH:MM:SS"
        let newDate = newDateFormatter.string(from: _date)

        return newDate
    }

}


