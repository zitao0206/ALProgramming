//
//  Topic_05_LongestPalindromicSubstring.swift
//  Topics
//
//  Created by lizitao on 2022/11/21.
//

import Foundation

class Topic_05_LongestPalindromicSubstring : CommonOpsProtocol {
    func testCase() {
        print("https://leetcode.cn/problems/longest-substring-without-repeating-characters/")
//        let s = "babad"
        let s = "babbad"
//        let s = "a"
        let subString = longestPalindrome(s)
        print(subString)
    }
    
    func longestPalindrome(_ s: String) -> String {
       let n = s.count
       if n < 2 {
           return s
       }
       var start = 0
       var maxLength = 0
       let sArray = Array(s)
       for i in 0..<n {
           let oddLength = expandAroundCenter(sArray, n, i, i)
           let evenLength = expandAroundCenter(sArray, n, i, i + 1)
           let length = max(oddLength, evenLength)
           if length > maxLength {
               maxLength = length
               start = i - (maxLength - 1) / 2
           }
       }
       return String(sArray[start..<start+maxLength])
    }
       
    func expandAroundCenter(_ s: [Character], _ n: Int, _ left: Int, _ right: Int) -> Int {
       var l = left
       var r = right
       while l >= 0 && r < n && s[l] == s[r] {
           l -= 1
           r += 1
       }
       return r - l - 1
    }
    
    func longestPalindrome00(_ s: String) -> String {
        let n = s.count
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        var longestPalindrome = ""
        
        // Base case: all substrings of length 1 are palindromes
        for i in 0..<n {
            dp[i][i] = true
            longestPalindrome = String(obtanSubstring(s, begin: i, end: i))
        }
        // Base case: substrings of length 2 are palindromes if they have the same character
        for i in 0..<n-1 {
            if targetChar(s, i) == targetChar(s, i + 1) {
                dp[i][i+1] = true
                longestPalindrome = obtanSubstring(s, begin: i, end: i + 1)
            }
        }
        if n < 3 {
            return longestPalindrome
        }
        // Fill the dp array for substrings of length 3 or more
        //let s = "babadd"
        for len in 3...n {
           for i in 0..<n-len+1 {
               let j = i + len - 1
               if targetChar(s, i) == targetChar(s, j) && dp[i+1][j-1] {
                   dp[i][j] = true
                   let substring = obtanSubstring(s, begin: i, end: j)
                   if substring.count > longestPalindrome.count {
                       longestPalindrome = substring
                   }
               }
           }
        }
        
        return longestPalindrome
    }
    
    func targetChar(_ s: String, _ i: Int) -> Character {
        return s[s.index(s.startIndex, offsetBy: i)]
    }
    
    func obtanSubstring(_ s: String, begin: Int, end: Int) -> String {
        return String(s[s.index(s.startIndex, offsetBy: begin)..<s.index(s.startIndex, offsetBy: end + 1)])
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
            let res1 = obtanSubstring(s, begin: begin + 1, end: end)
            let res2 = obtanSubstring(s, begin: begin , end: end - 1)
            let s1 = recurPalindromicSubstring(s: res1)
            let s2 = recurPalindromicSubstring(s: res2)
            
            if (s1.count >= s2.count) {
                return s1
            } else {
                return s2
            }
        }
    }
    
    func longestPalindrome01(_ s: String) -> String {
        return recurPalindromicSubstring(s: s)
    }
}
