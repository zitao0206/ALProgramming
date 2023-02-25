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
    
    func bubbleSort00(_ sourceArray: [Int]) -> [Int] {
        guard sourceArray.count > 1 else {
            return sourceArray
        }
        var sortedArray = sourceArray
        let kCount = sortedArray.count
        for i in 0 ..< kCount {
            for j in 0 ..< kCount - 1 - i {
                if sortedArray[j] > sortedArray[j+1] {
                    let tempValue = sortedArray[j]
                    sortedArray[j] = sortedArray[j+1]
                    sortedArray[j+1] = tempValue
                }
            }
        }
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






