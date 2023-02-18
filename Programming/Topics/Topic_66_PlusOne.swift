//
//  Topic_19_RemoveNthFromEnd.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation
 
class Topic_66_PlusOne : CommonOpsProtocol {
    func testCase() {
        let digits = [1,2,3]
//        let digits = [4,3,2,1]
        let res = plusOne(digits)
        print(res)
      
    }
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var i = digits.count - 1
        while i >= 0 {
            if result[i] < 9 {
                result[i] += 1
                return result
            } else {
                result[i] = 0
            }
            i -= 1
        }
        result.insert(1, at: 0)
        return result
    }
}

 

