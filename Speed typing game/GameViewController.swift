//
//  GameViewController.swift
//  Speed typing game
//
//  Created by Mouhammad Azroun on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var userInputTF: UITextField!
    var time = Difficulty.difficulties.dataToPass
    var score = 0
    var listPosition = 0
    var timer : Timer?
    var wordList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordList = addWords()
        
        wordLabel.text = wordList[listPosition]
        
        userInputTF.delegate = self
        
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "key") == nil{
            saveUserDefault(highScore: 0)
        }
    


        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(_) in
            self.countDown()
        }

                
    }
    
    // Count down function in order to show a count down to the user based on the difficulty the choose on the Difficulty view controller.
    func countDown(){
            timerLabel.text = ":0\(time)"
            time -= 1
            
            if time == -1 {
                time = Difficulty.difficulties.dataToPass
                score -= 1
                userInputTF.text = ""
                scoreLabel.text = "Score: \(score)"
                wordValue()
            }
    }
    
    func addWords() -> [String]{
        let list: [String] = ["car","bus","pity","begin","integration","feeling","state","steel","freedom","costume","researcher","exhibition","sticky","player","legend","literacy","imperial","context","contraction","garlic","ambition","dose","plug","visit","cross","pawn","barrel","model","take","salad"]
        return list
    }
    
    // a function that go through eatch word in the array and move to the score view controller when finished.
    func wordValue(){
        listPosition += 1
        
        if listPosition < wordList.count {
            wordLabel.text = wordList[listPosition]
        }else {
            Score.sharedScore.dataToPass = score
            var currentHighScore = retrieveDefaultValue()
            print(currentHighScore)
            HighScore.sharedHighScore.dataToPass = currentHighScore
            if currentHighScore < score{
                saveUserDefault(highScore: score)
                currentHighScore = retrieveDefaultValue()
                print(currentHighScore)
                HighScore.sharedHighScore.dataToPass = currentHighScore
            }
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "score_VC") as? ScoreViewController else{
                return
            }
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            present(vc, animated: true)
            
            // we call after invalidate funcion in order to stop the Timer after we have moved to the score View Controller.
            timer?.invalidate()
        }
    }
    // a function that gets exucted after the user presses return key on keyboard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let userInput : String = String(userInputTF.text!)
        if userInput == wordLabel.text {
            score += 1
            scoreLabel.text = "Score: \(score)"
            userInputTF.text = ""
        } else{
            score -= 1
            scoreLabel.text = "Score: \(score)"
            userInputTF.text = ""
        }
        wordValue()
        time = Difficulty.difficulties.dataToPass
        countDown()
            return true
        }
    
    func saveUserDefault (highScore : Int) {
        let defaults = UserDefaults.standard
        defaults.set(highScore, forKey: "key")
        defaults.synchronize()
    }
    
    func retrieveDefaultValue() -> Int{
        let defaults = UserDefaults.standard
            let currentHighScore = defaults.integer(forKey: "key")
            return currentHighScore
    }
    
}

// these two classes to pass the current score and the highest score value to the score view controller.
class Score {
    static let sharedScore = Score()
    var dataToPass: Int = 0
}

class HighScore {
    static let sharedHighScore = HighScore()
    var dataToPass: Int = 0
}
