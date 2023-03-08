//
//  StringCommonOps.swift
//  Topics
//
//  Created by lizitao on 2022/11/21.
//
import Foundation


class StringCommonOps : CommonOpsProtocol {
    func testCase() {
//        let s = "abcdefg"
//        let results = obtanSubstring(s: s, begin: 2, end: 3)
//        print(results)
//        forloop1(s)
//        forloop2(s)
//        forloop3(s)
        obtainIndexString()
        StringToNSString()
        NSStringToString()
        deleSubstring()
    }
    func obtainIndexString() {
        let greeting = "Guten Tag!"
        print(greeting[greeting.startIndex])
        // G
        print(greeting[greeting.index(before: greeting.endIndex)])
        // !
        print(greeting[greeting.index(after: greeting.startIndex)])
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        print(greeting[index])
        
    }
    //获取子串
    func obtanSubstring(s: String, begin: Int, end: Int) -> String {
        let res = String(s[s.index(s.startIndex, offsetBy: begin)..<s.index(s.startIndex, offsetBy: end + 1)])
        return res
    }
    
    //删除子串与删除字符
    func deleSubstring() {
        var ss = "WEWEWE12345"
        let obj = "WEWEWE"
        ss.removeSubrange(ss.startIndex..<ss.index(ss.startIndex, offsetBy: obj.count))
        print(ss)
        //删除字符"5"
        ss.remove(at: ss.index(ss.startIndex, offsetBy: 4))
        print(ss)
        
    }
    //通用删除指定子串
    func removeSubstring(_ original: String, _ subString: String) -> String {
        if original.isEmpty || subString.isEmpty || !original.contains(subString) {
            return original
        }
        var ss = original
        ss = ss.replacingOccurrences(of: subString, with: "")
        return ss
    }
    
    //字符串遍历
    func forloop1(_ s: String) {
        print("---- 正序遍历 ----")
        var i = 0
        for ch in s {
            print("i = \(i)",",","ch = \(ch)")
            i += 1
        }
        
        print("---- 逆序遍历 ----")
        var j = s.count
        for ch in s.reversed() {
            j -= 1
            print("j = \(j)",",","ch = \(ch)")
        }
    }
    
    func forloop2(_ s: String) {
        print("---- 正序遍历 ----")
        for i in 0..<s.count {
            let ch: Character = s[s.index(s.startIndex, offsetBy: i)]
            print("i = \(i)",",","ch = \(ch)")
        }
    }
    
    func forloop3(_ s: String) {
        print("---- 正序遍历 ----")
        for (i, ch) in s.enumerated() {
            print("i = \(i)",",","ch = \(ch)")
        }
    }
   
    func forloop4(_ s: String) {
        print("---- 正序遍历 ----")
        let begin = 1
        for i in stride(from: begin, through: s.count - 1, by: 1) {
            let ch: Character = s[s.index(s.startIndex, offsetBy: i)]
            print("i = \(i)",",","ch = \(ch)")
        }
    }
    
    //判断是否回文字符串，例如aba,abba,121等
    func isPalindromicSubstring(s: String) -> Bool {
        let len = s.count
        for i in 0..<len / 2 {
            let ch1: Character = s[s.index(s.startIndex, offsetBy: i)]
            let ch2: Character = s[s.index(s.startIndex, offsetBy: s.count - 1 - i)]
            print("i = \(i)",",","ch1 = \(ch1)")
            print("i = \(i)",",","ch2 = \(ch2)")
            if ch1 != ch2 {
                return false
            }
        }
        return true
    }
    
    //String与NSString的互转
    func StringToNSString()  {
        let a = String("1234567890")
        let b = a as NSString
        print(b.integerValue)
        print(b.length)
    }
    func NSStringToString()  {
        let a : NSString = "1234567890"
        let b = a as String
        print(b)
    }

}
