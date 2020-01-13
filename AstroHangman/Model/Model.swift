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
    let wordArray : [String]
    let wordManipulator = WordManipulator()
    
    init(){
        wordArray = ["fats","carbohydrates","protein","calories" ]
        word = self.selectRandomWord()
    }
    
    //Returns a random woard from word array
    func selectRandomWord() -> String {
        var randoInt = Int.random(in: 0..<wordArray.count)
        word = wordArray[randoInt]
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
    

}
