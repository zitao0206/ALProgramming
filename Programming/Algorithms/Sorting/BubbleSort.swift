//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class BubbleSort : CommonOpsProtocol {
    
    func testCase() {
        let sourceArray = [9, 4, 7, 2, 1, 8, 0, 3, 6, 5]
        let sortedArray = bubbleSort(sourceArray)
        print(sortedArray) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
    
    func bubbleSorting00(_ sourceArray: [Int]) -> [Int] {
        // 判断数组长度是否大于1，如果不是，则返回原数组
        guard sourceArray.count > 1 else {
            return sourceArray
        }
        
        // 将原数组复制一份，避免修改原数组
        var sortedArray = sourceArray
        
        // 待排序数组的长度
        let kCount = sortedArray.count
        
        // 外层循环，控制循环次数
        for i in 0 ..< kCount {
            // 内层循环，每次都会将当前最大的元素移动到数组的末尾
            for j in 0 ..< kCount - 1 - i {
                // 如果前一个元素大于后一个元素，则交换它们的位置
                if sortedArray[j] > sortedArray[j+1] {
                    let tempValue = sortedArray[j]
                    sortedArray[j] = sortedArray[j+1]
                    sortedArray[j+1] = tempValue
                }
            }
        }
        
        // 返回排序后的数组
        return sortedArray
    }

    
    func bubbleSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else {
            return array
        }
        var sortedArray = array
        let kCount = sortedArray.count
        for i in 0..<kCount {
            for j in 1..<kCount-i {
                if sortedArray[j] < sortedArray[j-1] {
                    sortedArray.swapAt(j, j-1)
                }
            }
        }
        return sortedArray
    }

    
}






