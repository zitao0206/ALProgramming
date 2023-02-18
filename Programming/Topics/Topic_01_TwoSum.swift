//
//  Topic_01_TwoSum.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

class Topic_01_TwoSum : CommonOpsProtocol {
    func testCase() {
        print("https://leetcode.cn/problems/two-sum/")
        let nums:[Int] = [2,7,11,15]
        let target = 26
        let results = twoSum(nums, target)
        print(results)
    }
    //O(n*n) --- From myself
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count
        var results = [Int]()
        for (i,value) in nums.enumerated() {
            for j in i+1...n-1 {
                if value + nums[j] == target {
                    results.append(i)
                    results.append(j)
                    return results
                }
            }
        }
        results.append(0)
        return results
    }
    //O(n) --- From ChatGPT
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let index = dict[target - num] {
                return [index, i]
            }
            dict[num] = i
        }
        
        fatalError("No solution")
    }
}


