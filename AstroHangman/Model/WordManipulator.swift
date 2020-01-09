//
//  WordManipulator.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation


class WordManipulator{
    var word : String?
    var blankWord : String?
    var wordArray : [String] = []
    var blankWordArray : [String?] = []
    
    init(){
        wordArray = ["fats","carbohydrates","protein","calories" ]
    }
    
    func getWord(word: String)-> String? {
        return ""
    }
    
    func getBlankWord(wordLocal: String) -> String {
        var randoWord = ""
        var newBlankWord = ""
        
        if wordLocal != nil {
            randoWord = wordLocal
            var count = randoWord.count
            for i in 1...count{
                newBlankWord = "\(newBlankWord) _"
            }
            return newBlankWord
        } else {
            return "Must Enter Word!!!!"
        }
        
    }
        
       
        
    
    
    func getRandomWord() -> String? {
        var randoInt = Int.random(in: 0..<wordArray.count)
        word = wordArray[randoInt]
        return word
         
    }
}
