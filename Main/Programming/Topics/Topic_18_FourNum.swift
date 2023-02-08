//
//  Topic_18_FourNum.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_18_FourNum : Base {
    func testCase() {
        let nums = [-1, 0, 1, 1, 2, 3]
        //[-2, -1, 0, 0, 1, 2]
        // 0
        let target = 3 // -1 0 1 3
      
        let results = fourSum(nums, target)
        print(results)
    }
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else {
            return []
        }
        
        var solutions = [[Int]]()
        let sorted = nums.sorted() { $0 < $1 }
        let count = sorted.count
        let minSum = sorted[0] + sorted[1] + sorted[2] + sorted[3]
        let maxSum = sorted[count - 1] + sorted[count - 2] + sorted[count - 3] + sorted[count - 4]
        if target < minSum {
            return solutions
        }
        if target > maxSum {
            return solutions
        }
        print(sorted)
       
         for i in 0..<(nums.count - 3) {
             
             if i > 0 && sorted[i] == sorted[i - 1] {continue}
             
             for j in (i + 1)..<(nums.count - 2) {
             
                 if j > i + 1 && sorted[j] == sorted[j - 1] {continue}
                 var k = j + 1
                 var l = nums.count - 1
                 let twoSumTarget = target - sorted[i] - sorted[j]
                 while k < l {
                     let twoSum = sorted[k] + sorted[l]
                     if twoSum < twoSumTarget {k += 1}
                     if twoSum > twoSumTarget {l -= 1}
                     if twoSum == twoSumTarget {
                         solutions.append([sorted[i], sorted[j], sorted[k], sorted[l]])
                         repeat {k += 1} while k < l && sorted[k] == sorted[k - 1]
                         repeat {l -= 1} while k < l && sorted[l] == sorted[l + 1]
                     }
                 }
             }
         }
         return solutions
    }
       
        
}


