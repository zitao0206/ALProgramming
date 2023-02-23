//
//  ArrayCommonOps.swift
//  Topics
//
//  Created by lizitao on 2022/11/22.
//

import Foundation

extension Array {
    func customMap<T>(_ tansform:(Element)->T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(tansform(x))
        }
        return result
    }
    func customReduce<T>(_ initial:T, _ combine: (T, Element)->T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
    
    func customFilter(_ isInclude:(Element) -> Bool) ->[Element] {
        var result: [Element] = []
        for x in self where isInclude(x) {
            result.append(x)
        }
        return result
    }
    func customFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var tmp: [T] = []
        for value in self {
           tmp.append(contentsOf: transform(value))
        }
        return tmp
    }
  
    func customSplit(where condition: (Element) -> Bool) -> [[Element]] {
        var preResult: [Element] = []
        var sufResult: [Element] = []
        for (i, value) in self.enumerated() {
            if condition(value) {
                if i < self.count - 1 {
                    preResult.append(contentsOf: self[0...i-1])
                    sufResult.append(contentsOf: self[i+1...self.count - 1])
                    break
                } else {
                    preResult.append(contentsOf: self[0...i-1])
                    break
                }
               
            }
        }
        return self.isEmpty ? []: [preResult, sufResult]
    }
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}
class ArrayCommonOps : CommonOpsProtocol {
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
        print(a)
        print(b)
        print(c)
        //二维数组：
//        var array2D = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 3)
        var array2D = Array(repeating: Array(repeating: 0, count: 4), count: 3)
        for i in 0...2 {
            for j in 0...3 {
               array2D[i][j] = 1
           }
        }
        print(array2D)
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
    //数组的合并操作
    func mergeTest() {
        //数组的合并
        let a = ["a", "b", "c", "d"]
        let b = ["A", "B", "C", "D"]
        let c = [a, b].flatMap({ $0 })
        print ("c：\(c)" ) // ["a", "b", "c", "d", "A", "B", "C", "D"]
        let d = zip(a, b).flatMap({ [$0, $1] })
        print ("d：\(d)" ) //["a", "A", "b", "B", "c", "C", "d", "D"]
        
    }
    //map操作
    func customMapTest() {
        let a = [1, 2, 3, 4, 5]
        let b = a.map { $0 * 2 }
        let c = a.customMap { $0 * 2 }
        print(b) // [2, 4, 6, 8, 10]
        print(c) // [2, 4, 6, 8, 10]
    }
    //reduce操作
    func customReduceTest() {
        let a = [1, 2, 3, 4, 5]
        let b = a.reduce(0, +)
        let c = a.customReduce(0, +)
        print(b) // 15
        print(c) // 15
    }
    //Filter操作
    func customFilterTest() {
        let a = [1, 2, 3, 4, 5]
        let b = a.filter { $0 % 2 == 0 }
        let c = a.customFilter { $0 % 2 == 0 }
        print(b) // [2, 4]
        print(c) // [2, 4]
    }
    //flatMap操作
    func customFlatMapTest() {
        let a = ["a", "b", "c", "d"]
        let b = ["A", "B", "C", "D"]
        let c = [a, b].flatMap({ $0 })
        let d = [a, b].customFlatMap({ $0 })
        print (c) //["a", "b", "c", "d", "A", "B", "C", "D"]
        print (d) //["a", "b", "c", "d", "A", "B", "C", "D"]
    }
    //zip操作
    func zipTest() {
        //zip函数将两个序列的元素配对，并生成一个由元组构成的新序列。
        let a = [1, 2, 3, 4, 5]
        let b = [ "a" ,  "b" ,  "c"]
        let c = zip(a, b).map{ $0 }
        print(c)//[(1, "a"), (2, "b"), (3, "c")]
        let d = zip(1..., b).map{ $0 }
        print(d) //[(1, "a"), (2, "b"), (3, "c")]

        let zipped = zip(a, b)
        for (num, word) in zipped {
            print("\(num) is the word for \(word)")
        }
        //1 is the word for a
        //2 is the word for b
        //3 is the word for c
        let zipped1 = zip(a, a.dropFirst())
        for (a1, a2) in zipped1 {
            print("\(a1) <----> \(a2)")
        }
//        1 <----> 2
//        2 <----> 3
//        3 <----> 4
//        4 <----> 5
    }
    func customSplitTest() {
        let strings = ["apple", "aanana", "apricot", "orange", "pear"]
        let result = strings.customSplit{ $0 == "pear"}
        print(result) // 输出 [["apple", "apricot"], ["banana"], ["orange"], ["pear"]]

    }
    func customAccumulateTest() {
        let a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let res1 = a.accumulate(0) { r, i in
            return r + i - 1
        }
        let res2 = a.accumulate(0, +)
        print(res1)
        print(res2)
        
    }
    
    func testCase() {
        initForArray()
        customMapTest()
        customReduceTest()
        customFilterTest()
        customFlatMapTest()
        zipTest()
        mergeTest()
        customSplitTest()
        customAccumulateTest()
    }
    

   
}


