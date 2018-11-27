//
//  AnalyticsViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 17/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit
import SwiftChart

class AnalyticsViewController: UIViewController, ChartDelegate {



    @IBOutlet weak var chart: Chart!
    var exerciseName: String!
    var results: [(String, Double)]!

    override func viewDidLoad() {
        super.viewDidLoad()

        results = DBManager.sharedInstance.getStatisticForExerciseResults(year: 2018, exerciseName: exerciseName)

        chart.delegate = self
        configureChart()

        print(exerciseName)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransition(to: size, with: coordinator)

        // Redraw chart on rotation
        chart.setNeedsDisplay()

    }

    func configureChart() {

        let data = [
            (x: 1, y: results[0].1),
            (x: 2, y: results[1].1),
            (x: 3, y: results[2].1),
            (x: 4, y: results[3].1),
            (x: 5, y: results[4].1),
            (x: 6, y: results[5].1),
            (x: 7, y: results[6].1),
            (x: 8, y: results[7].1),
            (x: 9, y: results[8].1),
            (x: 10, y: results[9].1),
            (x: 11, y: results[10].1),
            (x: 12, y: results[1].1)
        ]

        let months = ["J", "F", "M", "A", "Ma", "J", "Jl", "A", "S", "O", "N", "D"]
        let series = ChartSeries(data: data)

        series.area = true
        chart.xLabels = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        chart.xLabelsFormatter = {(labelIndex: Int, labelValue: Double) -> String in
            return months[labelIndex]
        }
        chart.add(series)

    }

    func didTouchChart(_ chart: Chart, indexes: [Int?], x: Double, left: CGFloat) {

    }

    func didFinishTouchingChart(_ chart: Chart) {

    }

    func didEndTouchingChart(_ chart: Chart) {

    }


}
