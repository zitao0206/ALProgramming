//
//  Topic_17_LetterCombinations.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_17_LetterCombinations : NSObject {
    func TestCase() {
        let nums = "234"
      
        let results = letterCombinations(nums)
        print(results)
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        let symbols:[Character: [String]] = [
                      "2": ["a", "b", "c"],
                      "3": ["d", "e", "f"],
                      "4": ["g", "h", "i"],
                      "5": ["j", "k", "l"],
                      "6": ["m", "n", "o"],
                     "7": ["p", "q", "r", "s"],
                     "8": ["t", "u", "v"],
                     "9": ["w", "x", "y", "z"],
                    ]
        
        let s = digits
        var result = [String]()
        
        if s.isEmpty {
            return result
        }
        if s.count == 1 {
            return symbols[Character(s)] ?? result
        }
        let nextComb = letterCombinations(String(s.dropFirst()))
        let current = symbols[s[s.startIndex]]!
        for c in current {
            for i in 0..<nextComb.count {
                result.append(String(c) + nextComb[i])
            }
        }
        return result
    }
       
        
}


