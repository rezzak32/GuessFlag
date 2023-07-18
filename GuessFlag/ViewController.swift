//
//  ViewController.swift
//  GuessFlag
//
//  Created by Rezzak on 18.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var question = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        countries.append("uae")

        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        
        button1.layer.borderColor = UIColor.gray.cgColor
        button2.layer.borderColor = UIColor.gray.cgColor
        button3.layer.borderColor = UIColor.gray.cgColor


        asqQuestion(action: nil)

    }
    func asqQuestion(action: UIAlertAction!) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        flagLabel.text = "\(question). Which one is \(countries[correctAnswer].uppercased())"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        question += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            
            
        }else {
            title = "Wrong"
        }
        
        if question == 6 {
            showScoreAndEndGame()
            return
            
        }
        scoreLabel.text = "Score: \(String(score))"
        // questionLabel.text = "Question \(question)"
        
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
                
        ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: asqQuestion))
        
        present(ac, animated: true)
        
        
    }
    func showScoreAndEndGame() {
            performSegue(withIdentifier: "showScoreSegue", sender: nil)
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScoreSegue" {
            if let scoreViewController = segue.destination as? ScoreViewController {
                scoreViewController.finalScore = score
            }
        }
    }
}

