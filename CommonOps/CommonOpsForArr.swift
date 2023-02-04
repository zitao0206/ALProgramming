//
//  CommonOpsForArr.swift
//  Topics
//
//  Created by lizitao on 2022/11/22.
//

import Foundation

extension Array {
    func customFilter(_ isInclude:(Element) -> Bool) ->[Element] {
        var result: [Element] = []
        for x in self where isInclude(x) {
            result.append(x)
        }
        return result
    }
    func customMap<T>(_ tansform:(Element)->T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(tansform(x))
        }
        return result
    }
    func split(where condition: (Element, Element) -> Bool) -> [[Element]] {
        var result: [[Element]] = self.isEmpty ? [] : [[self[0]]]
        for (previous, current) in zip(self, self.dropFirst()) {
            if condition(previous, current) {
                result.append([current])
            } else {
                result[result.endIndex-1].append(current)
            }
        }
        return result
    }
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}
class CommonOpsForArr : NSObject {
    
    func TestCase() {
//        opsForZip()
        sliceForArr()

    }
    // 数组的切片
    func sliceForArr() {
        let a = [1, 2, 2, 2, 3, 4, 4]
        let slice_b = type(of: a)
        print(slice_b)
        
        let new_a = Array(arrayLiteral: slice_b)
        print(new_a)
 
    }
    // zip操作
    func opsForZip() {
//数组的合并成元组
//        let a = [1, 2, 3, 4, 5]
//        let b = [ "a" ,  "b" ,  "c"]
//        let c = zip(a, b).map{ $0 }
//        print(c)
//        let b = ["a", "b", "c"]
//        let c = zip(1..., b).map{ $0 }
//        print(c)
//字典的构造1
//        let names = ["Apple", "Pear"]
//        let prices = [7, 6]
//        let dict =  Dictionary(uniqueKeysWithValues:zip(names, prices))
//        print(dict)
//字典的构造2
//        let array = [ "Apple",  "Pear",  "Pear",  "Orange"]
//        let dic = Dictionary(zip(array, repeatElement(1, count: array.count)), uniquingKeysWith: +)
//        print (dic)
//数组的合并
//        let a = ["a", "b", "c", "d"]
//        let b = ["A", "B", "C", "D"]
//        let c = [a, b].flatMap({ $0 })
//        print ("c：\(c)" )
//        let d = zip(a, b).flatMap({ [$0, $1] })
//        print ("d：\(d)" )
    }
    
    //数组的初始化
    func initForArray() {
        let a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
        var b = [Int]()
        b.append(1)
        b.append(2)
        b.append(3)
        b.append(4)
        b.append(5)
        let c:[Int] = [10, 20, 30]
    }
    
    //数组的遍历
    func visitForArray() {
        let a = [1, 2, 3, 4, 5, 6]
        print("-----------全部遍历-------------")
        for obj in a {
            print(obj) // 1,2,3,4,5,6
        }
        print("-----------部分遍历-------------")
        for obj in a.dropFirst() {
            print(obj) //2,3,4,5,6
        }
        for obj in a.dropLast(3) {
            print(obj) //1,2,3
        }
        print("-----------带元素下标的访问--------------")
        for (i, obj) in a.enumerated() {
            print("\(i)-->\(obj)")
        }
        print("------------索引区间-------------")
        for (i, obj) in zip(a.indices, a) {
            print("\(i)-->\(obj)")
        }
        //获取索引区间
        let b = [Int](90...97)
        for i in b.indices {
            print(b[i])
        }
        
    }
}


