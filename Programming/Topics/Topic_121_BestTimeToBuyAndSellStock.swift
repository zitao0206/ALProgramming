//
//  Topic_19_RemoveNthFromEnd.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation
 
class Topic_121_BestTimeToBuyAndSellStock : CommonOpsProtocol {
    func testCase() {
//        let prices = [7, 1, 5, 3, 6, 4]
        let prices = [7,6,4,3,1]
        let res = maxProfit(prices)
        print(res)
      
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        let p = prices
        if p.count < 2 {
            return 0
        }
        var maxValue = 0
        var buy = p[0]
        var sell: Int = 0
        for value in p.dropFirst() {
            sell = value
            let temp = sell - buy
            if temp > maxValue {
                maxValue = temp
            } else {
                if temp < 0 {
                    buy = sell
                }
            }
        }
        return maxValue
    }
}

 

