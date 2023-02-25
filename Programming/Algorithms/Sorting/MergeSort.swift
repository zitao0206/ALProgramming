//
//  MergeSort.swift
//  Programming
//
//  Created by lizitao on 2023/2/25.
//

import Foundation

class MergeSort : CommonOpsProtocol {
    
    func testCase() {
        let sourceArray = [9, 7, 4, 2, 1, 8, 0, 3, 6, 5]
        let sortedArray = mergeSort(sourceArray)
        print(sortedArray) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
    }
    
    func mergeSort<T: Comparable> (_ sourceArray: [T]) -> [T] {
        // 如果数组长度小于等于1，则无需排序，直接返回
        guard sourceArray.count > 1 else {
            return sourceArray
        }
        
        // 将数组一分为二
        let kCount = sourceArray.count
        let middleIndex = kCount / 2
        let leftArray = mergeSort(Array(sourceArray[0..<middleIndex]))
        let rightArray = mergeSort(Array(sourceArray[middleIndex..<kCount]))
        
        // 合并两个有序数组
        return merge(leftArray, rightArray)
    }

    // 合并两个有序数组
    func merge<T: Comparable> (_ leftArray: [T], _ rightArray: [T]) -> [T] {
        // 左右两个数组的索引值
        var leftIndex = 0
        var rightIndex = 0
        
        // 合并后的有序数组
        var mergedArray = [T]()
        
        // 左右两个数组的长度
        let leftCount = leftArray.count
        let rightCount = rightArray.count
        
        // 比较左右两个数组中的元素，将较小的元素放入合并后的数组中
        while leftIndex < leftCount && rightIndex < rightCount {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                mergedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else {
                mergedArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        
        // 将剩余的元素放入合并后的数组中
        return mergedArray + Array(leftArray[leftIndex..<leftCount]) + Array(rightArray[rightIndex..<rightCount])
    }
}
