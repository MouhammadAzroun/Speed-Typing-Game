//
//  ViewController.swift
//  Speed typing game
//
//  Created by Mouhammad Azroun on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startGameButton(_ sender: UIButton) {
        performSegue(withIdentifier: "difficulty", sender: nil)
    }
    
}

