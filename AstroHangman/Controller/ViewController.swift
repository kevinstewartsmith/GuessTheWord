//
//  ViewController.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfGuessesLeft : Int = 0
    var playerViewData = ""
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        //print(sender.titleLabel?.text)
        var guess = model.guess(letter: String(sender.titleLabel?.text?.lowercased() ?? "AA"))
        
        playerView.text = guess
        processGueses()
    }
    @IBOutlet weak var playerView: UILabel!
    @IBOutlet weak var numGuessesLeft: UILabel!
    //@IBOutlet weak var letterTextField: UITextField!
    //@IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var outcomeLabel: UILabel!
    var dataModel = DataModel()
    var model = Model()
    var secretWord : String?
    var startingGuesses : Int?
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        //guessButton.isEnabled = true
        playerView.textColor = UIColor.black
        numberOfGuessesLeft = 9
        numGuessesLeft.text = String(numberOfGuessesLeft)
        numGuessesLeft.font = numGuessesLeft.font.withSize(152)
        
        var randomWord = model.selectRandomWord()
        model.set(word: randomWord)
        model.revealedLetters = 0
        numberOfGuessesLeft = model.getSecretWord().count
        numGuessesLeft.text = String(numberOfGuessesLeft)
        let blankArray = model.makeNewBlankArrayFromWord(word: randomWord)
        print("blankArray--  : \(blankArray)")
        let wordArray = model.makeWordCharArray(word: randomWord)
        print("wordArray:-- \(wordArray)")
        print("getwordArray:-- \(model.getWordCharArray())")
        let blankWord = model.getBlankWord()
        playerView.text = blankWord
        outcomeLabel.text = ""
    }
    
//    @IBAction func guessesButton(_ sender: UIButton) {
//        if let text = letterTextField.text {
//            if text == "" {
//                print("Guess a letter!")
//            } else if text.count == 1 {
//                var guess = model.guess(letter: text)
//                print("model data: \(model.blankWordArray)       \(model.getWordCharArray())    \(model.word )")
//                print("Guess: \(guess)")
//                letterTextField.text = ""
//
//
//                playerView.text = guess
//            } else {
//                print("Too many letters!")
//                letterTextField.text = ""
//            }
//
//
//        }
//        processGueses()
////        numberOfGuessesLeft -= 1
////        numGuessesLeft.text = String(numberOfGuessesLeft)
////        if numberOfGuessesLeft == 0 {
////            print("You dies!")
////
////            self.numGuessesLeft.text = "Fuck yoo!"
////            self.numGuessesLeft.font = numGuessesLeft.font.withSize(20)
////            guessButton.isEnabled = false
////            playerView.text = model.word
////            playerView.textColor = UIColor.red
////        }
////        var bool = false
////        if model.revealedLetters == model.getSecretWord().count {
////            guessButton.isEnabled == false
////            outcomeLabel.text = "WINNER!!!"
////        }
//
//
//
//    }
    func processGueses() {
        if model.takeAwayGuess == true {
            numberOfGuessesLeft -= 1
        }
        
        numGuessesLeft.text = String(numberOfGuessesLeft)
        if numberOfGuessesLeft == 0 {
            print("You dies!")
            
            self.numGuessesLeft.text = "Fuck yoo!"
            self.numGuessesLeft.font = numGuessesLeft.font.withSize(20)
            //guessButton.isEnabled = false
            playerView.text = model.word
            playerView.textColor = UIColor.red
        }
        var bool = false
        if model.revealedLetters == model.getSecretWord().count {
            //guessButton.isEnabled == false
            outcomeLabel.text = "WINNER!!!"
            print("WINNER WINNER Chicken Dinner!!!!!!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var randomWord = model.selectRandomWord()
        model.set(word: randomWord)
        numberOfGuessesLeft = model.getSecretWord().count
        numGuessesLeft.text = String(numberOfGuessesLeft)
        let blankArray = model.makeNewBlankArrayFromWord(word: randomWord)
        print("blankArray--  : \(blankArray)")
        let wordArray = model.makeWordCharArray(word: randomWord)
        print("wordArray:-- \(wordArray)")
        print("getwordArray:-- \(model.getWordCharArray())")
        model.revealedLetters = 0
        let blankWord = model.getBlankWord()
        playerView.text = blankWord
        
        
        
        
        
    }


}

