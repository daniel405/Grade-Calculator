//
//  ResultsViewController.swift
//  PanicMode
//
//  Created by Daniel Katz on 2018-04-18.
//  Copyright © 2018 Daniel Katz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var averageWanted: UILabel!
    @IBOutlet weak var averageNeeded: UILabel!
    
    var resultText = String()
    var averageWantedText = String()
    var averageNeededText = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = resultText
        averageWanted.text = averageWantedText
        averageNeeded.text = averageNeededText

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
