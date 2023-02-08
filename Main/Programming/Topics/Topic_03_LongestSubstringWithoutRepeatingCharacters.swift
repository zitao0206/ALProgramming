//
//  Topic_03_LongestSubstringWithoutRepeatingCharacters.swift
//  Topics
//
//  Created by lizitao on 2022/11/15.
//

import Foundation

class Topic_03_LongestSubstringWithoutRepeatingCharacters : Base {
    func testCase() {
        print("https://leetcode.cn/problems/longest-substring-without-repeating-characters/")
        let s = "abcabcbb"
//        let s = "bbbb"
//        let s = "pwwkew"
//        let s = "au"
//        let s = "dvdf"
        let length = lengthOfLongestSubstring(s)
        print(length)
    }
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var result = 1
        var begin = -1
        var walkDict = [Character: Int]()
        for (i, ch) in s.enumerated() {
            if (walkDict[ch] != nil) && walkDict[ch]! > -1 && walkDict[ch]! > begin {
                begin = walkDict[ch]!
                walkDict[ch] = i
            } else {
                walkDict[ch] = i
                if result < i - begin {
                    result = i - begin
                }
            }
        }
        print(walkDict)
        return result
    }
    
    
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        if s.isEmpty {
//            return 0
//        }
//        var result = 1
//        for (i, ch1) in s.enumerated() {
//            for j in stride(from: i+1, through: s.count - 1, by: 1) {
//                let ch2: Character = s[s.index(s.startIndex, offsetBy: j)]
//                let length = j - i
//                if ch2 == ch1 {
//                    if result < length {
//                        result = length
//                    }
//                    break
//                }
//            }
//        }
//        return result
//    }
}
