//
//  DictionaryCommonOps.swift
//  Topics
//
//  Created by lizitao on 2022/11/22.
//

import Foundation

class DictionaryCommonOps : CommonOpsProtocol {
    
    func initForDic() {
        //字典的构造1
        let names = ["Apple", "Pear"]
        let prices = [7, 6]
        let dict =  Dictionary(uniqueKeysWithValues:zip(names, prices))
        print(dict) // ["Apple": 7, "Pear": 6]
        
        //字典的构造2
        let array = [ "Apple",  "Pear",  "Pear",  "Orange"]
        let dic = Dictionary(zip(array, repeatElement(1, count: array.count)), uniquingKeysWith: +)
        print (dic) // ["Orange": 1, "Pear": 2, "Apple": 1]
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
    func testCase() {
        initForDic()
//        opsForDic()
    }
}


