//
//  DataModel.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation

class DataModel{
    //let randomNumber : UInt32?
    //let randoInt : Int?
    //let randoInt : Int
    //var nutrientsArray : [String?]
    var secretWord : String?
    let wordManipulator : WordManipulator
    
    init() {
        wordManipulator = WordManipulator()
        secretWord = wordManipulator.getRandomWord()
       // nutrientsArray =  ["carbohydrates","fats","protein","sodium","calories"]
        //randomNumber = arc4random_uniform(5)
       // randoInt = Int.random(in: 0..<5)
       // secretWord = nutrientsArray[randoInt]

    }
    
    func getSecretWord() -> String? {
        //var secretWord : String?
        
        
        
        

        return wordManipulator.getRandomWord()
    }
    
    func getPlayerView()-> String {
        if secretWord != nil {
             var wordy = wordManipulator.getBlankWord(wordLocal: secretWord ?? "niiiil")
            return wordy
        } else {
           return ""
        }
        
        
    }
    
    
    
    
  
}
    


//extension String {
//    func indicesOf(string: String) -> [Int] {
//        var indices = [Int]()
//        var searchStartIndex = self.startIndex
//
//        while searchStartIndex < self.endIndex,
//            let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
//            !range.isEmpty
//        {
//            let index = distance(from: self.startIndex, to: range.lowerBound)
//            indices.append(index)
//            searchStartIndex = range.upperBound
//        }
//
//        return indices
//    }
//}

