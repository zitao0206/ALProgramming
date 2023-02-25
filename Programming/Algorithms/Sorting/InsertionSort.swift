//
//  InsertionSort.swift
//  Programming
//
//  Created by lizitao on 2023/2/25.
//

import Foundation

class InsertionSort : CommonOpsProtocol {
    
    func testCase() {
        let sourceArray = [9, 7, 4, 2, 1, 8, 0, 3, 6, 5]
        let sortedArray = insertionSort(sourceArray)
        print(sortedArray) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
    }
    
    func insertionSort<T: Comparable>(_ sourceArray: [T]) -> [T] {
        var sortedArray = sourceArray
        guard sortedArray.count > 1 else {
            return sourceArray
        }
        for i in 1..<sortedArray.count {
            let currentValue = sortedArray[i]  // 当前值
            var j = i - 1 // 有序区间的最后一个元素
            
            while j >= 0 && sortedArray[j] > currentValue { // 找到插入位置
                sortedArray[j + 1] = sortedArray[j] // 移动元素
                j -= 1
            }
            
            sortedArray[j + 1] = currentValue // 插入元素到合适的位置
        }
        return sortedArray
    }

    
}
