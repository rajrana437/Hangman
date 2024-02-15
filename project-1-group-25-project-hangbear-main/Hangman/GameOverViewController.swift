//
//  GameOverViewController.swift
//  Hangman
//
//  Created by Account on 2023-02-24.
//

import UIKit

class GameOverViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var restartButton: UIImageView!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(restartButtonTapped(_:)))
        restartButton.isUserInteractionEnabled = true
        restartButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    // MARK: - Actions
    
    @objc private func restartButtonTapped(_ sender: UITapGestureRecognizer) {
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "mainView") as! ViewController
        present(mainViewController, animated: true)
    }
    
}
