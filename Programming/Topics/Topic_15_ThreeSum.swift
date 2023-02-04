//
//  Topic_15_ThreeSum.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_15_ThreeSum : NSObject {
    func TestCase() {
        let nums = [-1,0,1,2,-1,-4]
        let results = threeSum(nums)
        print(results)
    }

    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        var solutions = [[Int]]();
        let sorted = nums.sorted() { $0 < $1 }
        let count = sorted.count
        var i = 0
        print(sorted)
         
        while (i < count - 2) {
            if (i == 0 || (i > 0 && sorted[i] != sorted[i - 1])) {
                var left = i + 1
                var right = count - 1
                let num = sorted[i]
                while (left < right) {
                    let currentSum = sorted[left] + sorted[right] + num
                    if currentSum == 0 {
                        solutions.append([sorted[left], sorted[right], num])
                        while (left < right && sorted[left] == sorted[left + 1]) {
                            left += 1
                        }
                        while (left < right && sorted[right] == sorted[right - 1]) {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if currentSum < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            i += 1
        }
        return solutions
    }
}


