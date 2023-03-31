//
//  DifficultiyViewController.swift
//  Speed typing game
//
//  Created by Mouhammad Azroun on 2023-03-30.
//

import UIKit

class DifficultiyViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // in this view controller we pass how many seconds the player has based on the difficulty they choose.

    @IBAction func easyButton(_ sender: UIButton) {
        let easy: Int = 5
        Difficulty.difficulties.dataToPass = easy
        performSegue(withIdentifier: "easy", sender: nil)
    }
    
    @IBAction func normalButton(_ sender: UIButton) {
        let normal: Int = 3
        Difficulty.difficulties.dataToPass = normal
        performSegue(withIdentifier: "normal", sender: nil)
    }
    
    @IBAction func hardButton(_ sender: UIButton) {
        let hard: Int = 2
        Difficulty.difficulties.dataToPass = hard
        performSegue(withIdentifier: "hard", sender: nil)
    }
}

class Difficulty {
    static let difficulties = Difficulty()
    var dataToPass: Int = 0
}
