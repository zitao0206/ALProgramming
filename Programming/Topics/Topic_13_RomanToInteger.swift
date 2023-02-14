//
//  Topic_13_RomanToInteger.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_13_RomanToInteger : CommonOpsProtocol {
    func testCase() {
        let num = "LVIII"
        let result = romanToInt(num)
        print(result)
    }
    
    func romanToInt(_ s: String) -> Int {
        let scales:[Int] = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
        let symbols:[String] = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
        var result = 0
        var ss = s
        let kCount = scales.count
        for (i, obj) in symbols.reversed().enumerated() {
            while ss.hasPrefix(obj) {
                result = result + scales[kCount - 1 - i]
                ss.removeSubrange(ss.startIndex..<ss.index(ss.startIndex, offsetBy: obj.count))
            }
        }
        return result
    }
        
}


