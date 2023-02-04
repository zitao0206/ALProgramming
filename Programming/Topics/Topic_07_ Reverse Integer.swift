//
//  Topic_07_ Reverse Integer.swift
//  Topics
//
//  Created by lizitao on 2022/12/12.
//

import Foundation
class Topic_07_ReverseInteger {
    func TestCase() {
        print("https://leetcode.cn/problems/reverse-integer/")
        let x = 1534236469
        let result = reverse(x)
        print(result)
    }
    
    func reverse(_ x: Int) -> Int {
        var isNegtive: Bool = false
        var xValue = x
        if x < 0 {
            isNegtive = true
            xValue = abs(x)
        }
        let xNumber = xValue as NSNumber
        let xString : String = xNumber.stringValue
        var rString = ""
        for ch in xString.reversed() {
            rString.append(ch)
        }
        var result = (rString as NSString).integerValue
        if result > 2147483648 {
            result = 0
        }
        if isNegtive {
            result = -result
        }
        return result
    }

    
}
