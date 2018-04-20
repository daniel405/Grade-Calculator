//
//  ViewController.swift
//  PanicMode
//
//  Created by Daniel Katz on 2018-04-18.
//  Copyright © 2018 Daniel Katz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var grades: [UITextField]!
    
    @IBOutlet var weights: [UITextField]!
    
    func calculateAvg()  -> Int {
        var avg = 0.0
        var totalPercent = 0.0

        for i in 0...11 {
            if (grades[i].text != "" && weights[i].text != "" ) {
                avg += ((Double(grades[i].text!)! / 100) * Double(weights[i].text!)!)
                totalPercent += Double(weights[i].text!)!
            } else {
                continue
            }
        }
        
        return Int(avg/totalPercent*100)
    }
    
    @IBOutlet weak var averageWText: UITextField!
    
    func calculateAverageNeeded()  -> Double {
        var avg = 0.0
        var totalPercent = 0.0
        var totalGrades = 0.0

        for i in 0...11 {
            if (grades[i].text != "" && weights[i].text != "" ) {
                avg += ((Double(grades[i].text!)! / 100) * Double(weights[i].text!)!)
                totalPercent += Double(weights[i].text!)!
                totalGrades += Double(grades[i].text!)! / 100
            } else {
                continue
            }
        }
        
        let needed = ((Double(averageWText.text!)! - avg) / (100 - totalPercent)) * 100
        return needed
    }
        
    @IBAction func clearBtn(_ sender: Any) {
        for i in 0...11 {
            grades[i].text = ""
            weights[i].text = ""
            averageWText.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "results") {
            let DestinationViewController : ResultsViewController = segue.destination as! ResultsViewController
            DestinationViewController.resultText = String(calculateAvg()) + "%"
            DestinationViewController.averageWantedText = averageWText.text! + "%"
            if (averageWText.text == "") {
                DestinationViewController.averageNeededText = "You need -% on the remaining assignments."
            } else {
                DestinationViewController.averageNeededText = "You need " + String(calculateAverageNeeded()) + "% on the remaining assignments."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

