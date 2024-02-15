//
//  ViewController.swift
//  HangmanGame
//
//  Created by Raghul Ragavan on 08/02/23.
//

import UIKit

struct Hangman {
    
    static let wordSet = ["Rhombic", "Triumph", "Impetus", "Turmoil", "Jujutsu", "Scallop", "Optical", "Revival", "Luckily"]
    
    static func randomWord() -> String {
        return wordSet.randomElement() ?? ""
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var winScoreLabel: UILabel!
    @IBOutlet weak var loseScoreLabel: UILabel!
    @IBOutlet weak var hangmanImageView: UIImageView!
    @IBOutlet var letterLabels: [UILabel]!
    @IBOutlet var keyButtons: [UIButton]!
    
    var winCount = 0
    var loseCount = 0
    var counter = 0
    var hangmanImageNames = ["HangmanBg","Head", "LeftEar", "RightEar", "Body", "LeftLeg", "RightLeg"]
    var currentWord = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        currentWord = Hangman.randomWord()
        resetUI()
        counter = 0
    }
    
    func resetUI() {
        letterLabels.forEach { $0.text = "_" }
        keyButtons.forEach {
            $0.isEnabled = true
            $0.tintColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        }
        hangmanImageView.image = UIImage(named: "HangmanBg")
    }
    
    func revealLabels(letters character: Character) -> Bool {
        let uppercasedCharacter = String(character).uppercased()
        var found = false
        
        for (index, letter) in currentWord.enumerated() {
            if String(letter).uppercased() == uppercasedCharacter {
                letterLabels[index].text = String(letter).uppercased()
                letterLabels[index].font = UIFont(name: "Chalkboard SE Light", size: 30)
                found = true
            }
        }
        
        if !found {
            nextHangmanImage()
        }
        
        return found
    }
    
    func nextHangmanImage() {
        counter += 1
        
        if counter < hangmanImageNames.count {
            hangmanImageView.image = UIImage(named: hangmanImageNames[counter])
        } else {
            counter = 0
        }
        if counter == 6 {
            keyButtons.forEach { $0.isEnabled = false }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.loseRound()
            }
        }
    }
    
    func winRound() {
        winCount += 1
        winScoreLabel.text = String(winCount)
        showAlert(title: "You Won!", message: "Phew! You saved me! Would you like to play again?.")
        
    }
    
    func loseRound() {
        loseCount += 1
        loseScoreLabel.text = String(loseCount)
        showAlert(title: "You Lost!", message: "The word was '\(currentWord)'. Would you like to play again?")
       
    }
    
    func goToEndGame() -> Void {
        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let gameOver = sb.instantiateViewController(identifier: "gameOverVC")
        
        self.present(gameOver, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.newRound()
        }
        alert.addAction(yesAction)
        let noAction = UIAlertAction(title: "No", style: .default) { action in
            self.newRound()
            self.goToEndGame()
        }
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
    @IBAction func keyHandler(_ sender: UIButton) {
        
        
        if revealLabels(letters: Character(sender.titleLabel?.text ?? "") ) {
            sender.tintColor = UIColor(red: 0.00, green: 0.54, blue: 0.48, alpha: 1.00)
        }
        else {
            sender.tintColor = UIColor(red: 1.00, green: 0.54, blue: 0.48, alpha: 1.00)
        }
        
        
        if !letterLabels.contains(where: { $0.text == "_" }) {
            winRound()
        }
    }
    
}
