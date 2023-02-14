//
//  Topic_19_RemoveNthFromEnd.swift
//  Topics
//
//  Created by Leon0206 on 2022/11/14.
//

import Foundation

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}

//class List {
//    var head : ListNode?
//    var tail : ListNode?
//    
//    //尾插法
//    func appendToEnd(_ val : Int){
//        if tail == nil {
//            tail = ListNode(val)
//            head = tail
//        }else{
//            tail?.next = ListNode(val)
//            head = tail?.next
//        }
//    }
//    
//    //头插法
//    func appendToHead(_ val : Int){
//        if head == nil{
//            head = ListNode(val)
//            tail = head
//        }else{
//            let tmp = ListNode(val)
//            tail?.next = head
//            head?.next = tmp
//        }
//    }
//}
 
class Topic_19_RemoveNthFromEnd : CommonOpsProtocol {
    func testCase() {
        
        let l1 = ListNode(1)
        let l2 = ListNode(2)
        let l3 = ListNode(3)
        let l4 = ListNode(4)
        let l5 = ListNode(5)
      
        
        l1.next = l2
        l2.next = l3
        l3.next = l4
        l4.next = l5
    
        let results0 = removeNthFromEnd(l1, 5)
        self.printList(results0)
    }
    
    func printList(_ l: ListNode?) {
        var dummy = l
        while dummy != nil {
            print("node val: \(String(describing: dummy?.val))")
            dummy = dummy?.next
        }
    }

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p = head
        if p == nil {
            return head
        }
        if n == 0 {
            return head
        }
        
        var kCount = 1
        
        while p?.next != nil {
            p = p?.next
            kCount += 1
        }
        if n > kCount {
            return head
        }
        
        var q = head
        if n == kCount {
            q = q?.next
            head?.next = nil
            return q
        } else {
            var num = 1
            while num < kCount - n {
                q = q?.next
                num += 1
            }
            let l = q?.next
            q?.next = l?.next
            l?.next = nil
        }
        return head
    }
}

 

