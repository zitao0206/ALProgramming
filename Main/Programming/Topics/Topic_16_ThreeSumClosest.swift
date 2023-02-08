//
//  Topic_16_3SumClosest.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_16_ThreeSumClosest : Base {
    func testCase() {
        let nums = [4,0,5,-5,3,3,0,-4,-5]
        let target = -2
        let results = threeSumClosest(nums, target)
        print(results)
    }
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else {
            return 0
        }
       
        let sorted = nums.sorted() { $0 < $1 }
        let count = sorted.count
       
        
        let minSum = sorted[0] + sorted[1] + sorted[2]
        let maxSum = sorted[count - 1] + sorted[count - 2] + sorted[count - 3]
        
        var result = 0
        
        if target <= minSum {
            return minSum
        } else if target >= maxSum {
            return maxSum
        } else {
            
        }
         
        var i = 0
        var minResult = (1000 + 1000 + 1000 + 10000) * 2
        while (i < count - 2) {
            if (i == 0 || (i > 0 && sorted[i] != sorted[i - 1])) {
                var left = i + 1
                var right = count - 1
                let num = sorted[i]
                while (left < right) {
                    let currentSum = (sorted[left] + sorted[right] + num - target)
                    if currentSum == 0 {
                        return sorted[left] + sorted[right] + num
                    } else if currentSum < 0 {
                        if minResult > abs(currentSum) {
                            minResult = abs(currentSum)
                            result = sorted[left] + sorted[right] + num
                        }
                        left += 1
                    } else {
                        if minResult > abs(currentSum) {
                            minResult = abs(currentSum)
                            result = sorted[left] + sorted[right] + num
                        }
                        right -= 1
                    }
                }
            }
            i += 1
        }
        return result
    }
       
        
}


