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
    var model = Model()
    var secretWord : String?
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        numberOfGuessesLeft = 9
        numGuessesLeft.text = String(numberOfGuessesLeft)

        var randomWord = model.selectRandomWord()
        model.set(word: randomWord)
        let blankArray = model.makeNewBlankArrayFromWord(word: randomWord)
        print("blankArray--  : \(blankArray)")
        let wordArray = model.makeWordCharArray(word: randomWord)
        print("wordArray:-- \(wordArray)")
        print("getwordArray:-- \(model.getWordCharArray())")
        let blankWord = model.getBlankWord()
        playerView.text = blankWord
    }
    
    @IBAction func guessesButton(_ sender: UIButton) {
        if let text = letterTextField.text {
            if text == "" {
                print("Guess a letter!")
            } else if text.count == 1 {
                var guess = model.guess(letter: text)
                print("Guess: \(guess)")
                letterTextField.text = ""
                
                
                playerView.text = "Guess!"
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
        
        var randomWord = model.selectRandomWord()
        model.set(word: randomWord)
        let blankArray = model.makeNewBlankArrayFromWord(word: randomWord)
        print("blankArray--  : \(blankArray)")
        let wordArray = model.makeWordCharArray(word: randomWord)
        print("wordArray:-- \(wordArray)")
        print("getwordArray:-- \(model.getWordCharArray())")
        let blankWord = model.getBlankWord()
        playerView.text = blankWord
        
        
        
        
        
    }


}

