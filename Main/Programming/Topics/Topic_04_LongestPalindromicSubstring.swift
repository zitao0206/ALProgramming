//
//  Topic_04_LongestPalindromicSubstring.swift
//  Topics
//
//  Created by lizitao on 2022/11/21.
//

import Foundation

class Topic_04_LongestPalindromicSubstring : Base {
    func testCase() {
        print("https://leetcode.cn/problems/longest-substring-without-repeating-characters/")
//        let s = "babad"
//        let s = "babad"
        let s = "cbbd"
        let subString = longestPalindrome(s)
        print(subString)
    }
    
    func obtanSubstring(s: String, begin: Int, end: Int) -> String {
        let res = String(s[s.index(s.startIndex, offsetBy: begin)..<s.index(s.startIndex, offsetBy: end + 1)])
        return res
    }
    
    func isPalindromicSubstring(s: String) -> Bool {
        let len = s.count
        for i in 0..<len / 2 {
            let ch1: Character = s[s.index(s.startIndex, offsetBy: i)]
            let ch2: Character = s[s.index(s.startIndex, offsetBy: s.count - 1 - i)]
            print("i = \(i)",",","ch1 = \(ch1)")
            print("i = \(i)",",","ch2 = \(ch2)")
            if ch1 != ch2 {
                return false
            }
        }
        return true
    }
    
    func recurPalindromicSubstring(s: String) -> String {
        let len = s.count
        let begin = 0
        let end = s.count - 1
        if len <= 1 || isPalindromicSubstring(s: s) {
            return s
        } else {
            let res1 = obtanSubstring(s: s, begin: begin + 1, end: end)
            let res2 = obtanSubstring(s: s, begin: begin , end: end - 1)
            let s1 = recurPalindromicSubstring(s: res1)
            let s2 = recurPalindromicSubstring(s: res2)
            
            if (s1.count >= s2.count) {
                return s1
            } else {
                return s2
            }
        }
    }
    
    func longestPalindrome(_ s: String) -> String {
        return recurPalindromicSubstring(s: s)
    }
}
