//
//  Topic_283_MoveZeroes.swift
//  Programming
//
//  Created by lizitao on 2023/2/27.
//

import Foundation
class Topic_283_MoveZeroes : CommonOpsProtocol {
    func testCase() {
        var nums = [0,1,0,3,12]
        moveZeroes(&nums)
        print(nums)
    }
    func moveZeroes(_ nums: inout [Int]) {
       var i = 0, j = 0 // 定义慢指针i和快指针j
       while j < nums.count { // 循环直到快指针j到达数组末尾
           if nums[j] != 0 { // 如果当前数字不为0
               nums.swapAt(i, j) // 将当前数字交换到慢指针i所指向的位置
               i += 1 // 慢指针i向后移动一位
           }
           j += 1 // 快指针j向后移动一位
       }
    }
    
}
