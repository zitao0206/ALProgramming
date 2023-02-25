//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class BubbleSorting : CommonOpsProtocol {
    
    func testCase() {
        let sourceArray = [9, 4, 7, 2, 1, 8, 0, 3, 6, 5]
        let sortedArray = bubble_Sorting(sourceArray)
        print(sortedArray) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
    
    func bubble_Sorting(_ sourceArray: [Int]) -> [Int] {
        if sourceArray.count < 2 {
            return sourceArray
        }
        var tempArray = sourceArray
        let kCount = tempArray.count
        for i in 0 ..< kCount {
            for j in 0 ..< kCount - 1 - i {
                if tempArray[j] > tempArray[j+1] {
                    let tempValue = tempArray[j]
                    tempArray[j] = tempArray[j+1]
                    tempArray[j+1] = tempValue
                }
            }
        }
        return tempArray
    }
    
}






