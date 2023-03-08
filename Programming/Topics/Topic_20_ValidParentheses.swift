//
//  Topic_20_ValidParentheses.swift
//  Programming
//
//  Created by lizitao on 2023/3/8.
//

import Foundation

class Topic_20_ValidParentheses : CommonOpsProtocol {
    func testCase() {
//        let s = "()"
//        let s = "()[]{}"
//        let s = "(){}}{"
        let s = "[({(())}[()])]"
        let res = isValid(s)
        print(res)
    }
    
    func isValid(_ original: String) -> Bool {
        var s = original
        
        if s.count <= 1 { return false }
        
        let parenthesisLeft = "(",parenthesisRight = ")", parentheses = "()"
        let bracketLeft = "[", bracketRight = "]", brackets = "[]"
        let braceLeft = "{", braceRight = "}", braces = "{}"
     
        while s.contains(parentheses) || s.contains(brackets) || s.contains(braces) {
            s = s.replacingOccurrences(of: parentheses, with: "")
            s = s.replacingOccurrences(of: brackets, with: "")
            s = s.replacingOccurrences(of: braces, with: "")
        }
        
        if s.contains(parenthesisLeft) || s.contains(parenthesisRight) {
            if !s.contains(parentheses) {
                return false
            }
        }
        if s.contains(bracketLeft) || s.contains(bracketRight) {
            if !s.contains(brackets) {
                return false
            }
        }
        if s.contains(braceLeft) || s.contains(braceRight) {
            if !s.contains(braces) {
                return false
            }
        }
        return true
    }
    
}
