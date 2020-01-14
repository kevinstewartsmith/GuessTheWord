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
    @IBOutlet weak var guessButton: UIButton!
    var dataModel = DataModel()
    var model = Model()
    var secretWord : String?
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        guessButton.isEnabled = true
        numberOfGuessesLeft = 9
        numGuessesLeft.text = String(numberOfGuessesLeft)
        numGuessesLeft.font = numGuessesLeft.font.withSize(152)

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
                print("model data: \(model.blankWordArray)       \(model.getWordCharArray())    \(model.word )")
                print("Guess: \(guess)")
                letterTextField.text = ""
                
                
                playerView.text = guess
            } else {
                print("Too many letters!")
                letterTextField.text = ""
            }
            

        }
            
        numberOfGuessesLeft -= 1
        numGuessesLeft.text = String(numberOfGuessesLeft)
        if numberOfGuessesLeft == 0 {
            print("You dies!")
            
            self.numGuessesLeft.text = "You dies!"
            self.numGuessesLeft.font = numGuessesLeft.font.withSize(20)
            guessButton.isEnabled = false
        }
        
        
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

