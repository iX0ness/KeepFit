//
//  IntervalTimerViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 23/10/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class IntervalTimerViewController: UIViewController {

    @IBOutlet weak var setsValueLabel: UILabel!
    @IBOutlet weak var workTimeValueLabel: UILabel!
    @IBOutlet weak var restTimeValueLabel: UILabel!

    var setsValue: Int = 0
//    var workTimeHoursValue: Int = 0
//    var workTimeMinutesValue: Int = 0
//    var workTimeSecondsValue: Int = 0


    var timer = Timer()
    var time: Int = 0
    var timeTmp: Int = 0

    var restTime: Int = 0

    



    override func viewDidLoad() {
        super.viewDidLoad()
        
       setsValueLabel.text = "\(setsValue)"
       workTimeValueLabel.text = timeToString(time: TimeInterval(time))
       restTimeValueLabel.text = timeToString(time: TimeInterval(time))

    }



    @IBAction func increaseValue(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            setsValue+=1
            setsValueLabel.text = "\(setsValue)"

        case 2:

            time+=1
            timeTmp+=1
            workTimeValueLabel.text = timeToString(time: TimeInterval(time))

        case 3:
            restTime+=1
            restTimeValueLabel.text = timeToString(time: TimeInterval(restTime))
        default:
            break
        }
    }

    @IBAction func decreaseValue(_ sender: UIButton) {
        switch sender.tag {
        case 4:
            setsValue-=1
            setsValueLabel.text = "\(setsValue)"

        case 5:

            time-=1
            workTimeValueLabel.text = timeToString(time: TimeInterval(time))
        case 6:
            restTime-=1
            restTimeValueLabel.text = timeToString(time: TimeInterval(restTime))
        default:
            break
        }
    }
    @IBAction func startTimer(_ sender: Any) {
        runTimer()
    }
    @IBAction func resetTimer(_ sender: Any) {

    }

    @IBAction func stopTimer(_ sender: Any) {

    }

    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc private func updateTimer() {

        if time < 1 && setsValue == 0 {

            timer.invalidate()

        } else {

            if time == 0 {
                setsValue-=1
                time = timeTmp
            } else {
                time-=1
                workTimeValueLabel.text = timeToString(time: TimeInterval(time))
                setsValueLabel.text = "\(setsValue)"
            }

        }

    }

    func timeToString(time: TimeInterval) -> String{

        var workTimeHoursValue = Int(time) / 3600
        var workTimeMinutesValue = Int(time) / 60 % 60
        var workTimeSecondsValue = Int(time) % 60

        return ("\(String(format:"%02i", workTimeHoursValue)):\(String(format:"%02i", workTimeMinutesValue)):\(String(format:"%02i", workTimeSecondsValue))")
    }

}
