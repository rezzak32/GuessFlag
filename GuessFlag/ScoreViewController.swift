//
//  ScoreViewController.swift
//  GuessFlag
//
//  Created by Rezzak on 18.07.2023.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var finalScore: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
        scoreLabel.text = "Your Final score is: \(finalScore)"
    }
    

   

}
