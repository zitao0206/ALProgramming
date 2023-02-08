//
//  Topic_09_Palindrome Number.swift
//  Topics
//
//  Created by lizitao on 2022/12/12.
//

import Foundation
class Topic_09_PalindromeNumber : Base {
    func testCase() {
        print("https://leetcode.cn/problems/palindrome-number/")
        let x = 120021
        let result = isPalindrome(x)
        print(result)
    }

    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x == 0 {
            return true
        }
        let xValue = x as NSNumber
        let xString : String = xValue.stringValue
        return isPalindromicSubstring(s: xString)
    }
    
    func isPalindromicSubstring(s: String) -> Bool {
        let len = s.count
        for i in 0..<len / 2 {
            let ch1: Character = s[s.index(s.startIndex, offsetBy: i)]
            let ch2: Character = s[s.index(s.startIndex, offsetBy: s.count - 1 - i)]
            if ch1 != ch2 {
                return false
            }
        }
        return true
    }
}

