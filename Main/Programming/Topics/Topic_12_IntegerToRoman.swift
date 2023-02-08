//
//  Topic_16_3SumClosest.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_12_IntegerToRoman : Base {
    func testCase() {
        let num = 1994
        let result = intToRoman(num)
        print(result)
    }
    
    func intToRoman(_ num: Int) -> String {
        let scales:[Int] = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
        let symbols:[String] = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
      
        var nums:[Int:Int] = [Int: Int]()
        var value = num
        for obj in scales.reversed() {
            nums.updateValue(value/obj, forKey: obj)
            value = value % obj
        }
        var result = ""
        
        let kCount = symbols.count
        for (i, obj) in scales.reversed().enumerated() {
            var res = ""
            if let count = nums[obj] {
                for _ in 0..<count {
                    res.append(symbols[kCount - 1 - i])
                }
            }
            result.append(res)
        }
       
        return result
    }
        
}


