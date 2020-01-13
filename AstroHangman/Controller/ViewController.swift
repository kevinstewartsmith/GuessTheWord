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
        //print("Reset button works...check")
        numberOfGuessesLeft = 9
        numGuessesLeft.text = String(numberOfGuessesLeft)
        dataModel.createSecretWord()
        let word = dataModel.getSecretWord()
        //let blankWord = dataModel.getPlayerView(viewString: word ?? "no blank word")
        
         
        //print("Blank Array: \(blankArray)")
        
        //print(blankWord)
        //print("new word: \(word)")
        
        var randomWord = model.selectRandomWord()
        //print("randomWord: \(randomWord)")
        model.set(word: randomWord)
        let blankArray = model.makeNewBlankArrayFromWord(word: randomWord)
        print("blankArray: \(blankArray)")
        let blankWord = model.getBlankWord()
        print("blankWord: \(blankWord)")
        
        //print("model word: \(model.getSecretWord())")
        //let blank : String = dataModel.getPlayerView(viewString: word ?? "?????")
        //print("blank \(model.makeNewBlankArrayFromWord(word: randomWord))")
        //print(model.getBlankWord())
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
        
       // dataModel = DataModel()
//        var secretWord = dataModel.getSecretWord()
//        secretWord = dataModel.getSecretWord()
//        print("SecretWord: \(secretWord)")
//        playerView.text = secretWord
        var model = Model()
        var modelSecretWord = model.selectRandomWord()
        print(modelSecretWord)
        model.set(word: modelSecretWord)
        model.makeNewBlankArrayFromWord(word: modelSecretWord)
        print("initial blank array: \(model.blankWordArray)")
        var blankWord = model.getBlankWord()
        print(blankWord)
        
        print("viewDidLoad word\(model.word)")
        print("viewDidLoad Array \(model.blankWordArray)")
        playerView.text = blankWord
        
        
        
    }


}

