//
//  ViewController.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfGuessesLeft : Int = 9
    var playerViewData = ""
    @IBOutlet weak var playerView: UILabel!
    @IBOutlet weak var numGuessesLeft: UILabel!
    @IBOutlet weak var letterTextField: UITextField!
    var dataModel = DataModel()
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print("Reset button works...check")
        numberOfGuessesLeft = 9
        numGuessesLeft.text = String(numberOfGuessesLeft)
        playerView.text = dataModel.getPlayerView()
        
    }
    
    @IBAction func guessesButton(_ sender: UIButton) {
        if let text = letterTextField.text {
            if text == "" {
                print("Guess a letter!")
            } else if text.count == 1 {
                print(text)
                letterTextField.text = ""
                playerViewData = "\(playerViewData) \(text)"
                playerView.text = playerViewData
            } else {
                print("Too many letters!")
                letterTextField.text = ""
            }
        }
            
        numberOfGuessesLeft -= 1
        numGuessesLeft.text = String(numberOfGuessesLeft)
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // dataModel = DataModel()
        var secretWord = dataModel.getSecretWord()
        secretWord = dataModel.getSecretWord()
        print("SecretWord: \(secretWord)")
        playerView.text = secretWord
        
    }


}

