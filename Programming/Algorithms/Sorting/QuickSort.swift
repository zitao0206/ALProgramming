//
//  QuickSort.swift
//  Programming
//
//  Created by lizitao on 2023/2/25.
//

import Foundation

class QuickSort: CommonOpsProtocol {
    func testCase() {
        let sourceArray = [9, 7, 4, 2, 1, 8, 0, 3, 6, 5]
        var sourceArr = sourceArray
        let sortedArray: () = quickSort(&sourceArr, left: 0, right: sourceArray.count - 1)
        print(sortedArray) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
    }
    func quickSort(_ array: inout [Int], left: Int, right: Int) {
        guard left < right else {  // 如果左边界 >= 右边界，说明数组已经有序，直接返回
            return
        }
        
        // 分割数组，并获取基准元素的下标
        let pivotIndex = partition(&array, left: left, right: right)
        
        // 递归排序左半边
        quickSort(&array, left: left, right: pivotIndex - 1)
        // 递归排序右半边
        quickSort(&array, left: pivotIndex + 1, right: right)
    }

    func partition(_ array: inout [Int], left: Int, right: Int) -> Int {
        let pivot = array[right]  // 取最右边的元素为基准元素
        var i = left  // i 指向数组左边界
        
        for j in left..<right {  // 遍历数组
            if array[j] < pivot {  // 如果当前元素比基准元素小
                array.swapAt(i, j)  // 交换当前元素和 i 指向的元素
                i += 1  // i 向右移动一位
            }
        }
        
        array.swapAt(i, right)  // 将基准元素移动到中间位置
        return i  // 返回基准元素的下标
    }

    func quickSort_Plus<T: Comparable>(_ array: [T]) -> [T] {
        // 当数组元素个数小于等于1时，直接返回原数组
        guard array.count > 1 else {
            return array
        }
        // 选择中间位置的元素作为基准值
        let pivot = array[array.count/2]
        // 将原数组分成三个部分：小于、等于和大于基准值
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        // 递归调用自身对小于和大于基准值的两部分进行排序
        return quickSort_Plus(less) + equal + quickSort_Plus(greater)
    }


}
