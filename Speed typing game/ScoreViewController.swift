//
//  ScoreViewController.swift
//  Speed typing game
//
//  Created by Mouhammad Azroun on 2023-03-20.
//

import UIKit

class ScoreViewController: UIViewController {
    
    // in the score view controller we retreive the score and high score from game view controller and show it to the user.
    let score = Score.sharedScore.dataToPass
    let highScore = HighScore.sharedHighScore.dataToPass
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalScoreLabel.text = "Your Score: \(score)"
        highScoreLabel.text = "Highest Score \(highScore)"
        
    }
    @IBAction func playAgainButton(_ sender: UIButton) {
        performSegue(withIdentifier: "play_VC", sender: nil)
    }
}
