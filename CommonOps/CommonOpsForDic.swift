//
//  CommonOpsForDic.swift
//  Topics
//
//  Created by lizitao on 2022/11/22.
//

import Foundation

class CommonOpsForDic : NSObject {
    func TestCase() {
        opsForDic()
    }
    
    //字典的操作
    func opsForDic() {
        let emptyDic:[String: Int] = [:]
        //或者 var emptyDic:[Int:String] = [Int:String]()
        print(emptyDic)
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        //遍历
        for (key, value) in someDict {
           print("字典 key \(key) -  字典 value \(value)")
        }
        
        if let idx = someDict.index(forKey: 1) {
            someDict.remove(at: idx)
            print(someDict)
        }
        if let removedValue = someDict.removeValue(forKey: 2) {
            print(removedValue)
        }
        
       
    }
}


