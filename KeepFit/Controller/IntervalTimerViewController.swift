//
//  IntervalTimerViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 23/10/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class IntervalTimerViewController: UIViewController {

    //OUTLETS
    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var setsLabel: UILabel!


    var seconds = 0
    var sets = 0
    var secondsTmp = 0
    var timer = Timer()

    var isTimerRunning = false
    var resumeTapped = false


    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.isEnabled = false
    }

    @IBAction func increaseValue(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            sets+=1
            setsLabel.text = "\(sets)"

        case 2:

            seconds+=1
            secondsTmp+=1
            timeLabel.text = timeToString(time: TimeInterval(seconds))


        default:
            break
        }

    }
    @IBAction func decreaseValue(_ sender: UIButton) {


    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
    }
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.pauseButton.setTitle("Pause",for: .normal)
        }
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        self.seconds = 0
        self.sets = 0
        self.secondsTmp = 0
        setsLabel.text = "\(sets)"
        timeLabel.text = timeToString(time: TimeInterval(seconds))
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(IntervalTimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }

    @objc func updateTimer() {

        if sets < 1 {
            timer.invalidate()
        } else {
            if seconds < 1 {
                sets -= 1
                setsLabel.text = "\(sets)"
                seconds = secondsTmp
                timeLabel.text = timeToString(time: TimeInterval(seconds))
            } else {

                seconds -= 1
                timeLabel.text = timeToString(time: TimeInterval(seconds))


            }
        }

    }






    func timeToString(time: TimeInterval) -> String{

        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60

        return ("\(String(format:"%02i", hours)) : \(String(format:"%02i", minutes)) : \(String(format:"%02i", seconds))")
    }


}
