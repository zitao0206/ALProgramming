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
        guard sourceArray.count > 1 else {
            return sourceArray
        }
        let kCount = sourceArray.count
        let middleIndex = kCount / 2
        let leftArray = mergeSort(Array(sourceArray[0..<middleIndex]))
        let rightArray = mergeSort(Array(sourceArray[middleIndex..<kCount]))
        return merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable> (_ leftArray: [T], _ rightArray: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var mergedArray = [T]()
        let leftCount = leftArray.count
        let rightCount = rightArray.count
        
        while leftIndex < leftCount && rightIndex < rightCount {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                mergedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else {
                mergedArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        return mergedArray + Array(leftArray[leftIndex..<leftCount]) + Array(rightArray[rightIndex..<rightCount])
    }
}
