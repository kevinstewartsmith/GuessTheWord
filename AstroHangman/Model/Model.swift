//
//  Model.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/12/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation

class Model {
    var word : String?
    var blankWordArray : [String] = []
    var wordArray : [String]
    let wordManipulator = WordManipulator()
    
    init(){
        wordArray = ["fats","carbohydrates","protein","calories" ]
        word = self.selectRandomWord()
    }
    
    //Returns a random woard from word array
    func selectRandomWord() -> String {
        var randoInt = Int.random(in: 0..<wordArray.count)
        word = wordArray[randoInt]
        print("Selected random word: \(word)")
        return word ?? "butter"
    }
    
    
    func getSecretWord()-> String {
        return word ?? "Butter"
    }
    
    func getBlankWord() -> String {
        var word = blankWordArray.joined()
        print("joined word: \(word)")
        return word
    }
    
    func makeNewBlankArrayFromWord(word: String) -> [String]{
        var array : [String] = []
        for i in 1...word.count {
            array.append("_ ")
        }
        print(array)
        blankWordArray = array
        return array
    }
    
    func set(word theWord: String){
        word = theWord
    }
    
    func guess(letter: String) -> String {
        let char =  Character(letter)
         let wordArray : [Character] = Array(word ?? "guess")
        print("model.guess char: \(char)    \(word?.contains(char) ?? false)  \(blankWordArray)")
        if word?.contains(char) ?? false {
            var charString = String(char)
            let idxArray = word?.indicesOf(string: charString)
            print(idxArray)
            print(charString)
            
            print(wordArray)
            return "contained!!"
        } else {
            return "not contained!!!"
        }
        
        return "guess"
    }
    func makeWordArray(word: String) -> [String] {
        var array : [String] = []
        var count = 0
        for i in word {
            array.append(String(i))
        }
        print("Array: \(array)")
        wordArray = array
        return array
    }
    func getWordArray() -> [String] {
        return wordArray
    }
}
