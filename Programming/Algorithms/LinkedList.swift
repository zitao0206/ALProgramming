//
//  main.swift
//  ALProgramming
//
//  Created by lizitao on 2023/2/4.
//

import Foundation

class ListNode {
    public var val: Int
    
    public var next: ListNode?
    
    public init() {
        self.val = 0;
        self.next = nil;
        
    }
    
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
        
    }
}

class List {
    var head : ListNode?
    var tail : ListNode?
    
    //尾插法
    func appendToEnd(_ val : Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else{
            tail?.next = ListNode(val)
            head = tail?.next
        }
    }
    
    //头插法
    func appendToHead(_ val : Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        }else{
            let tmp = ListNode(val)
            tail?.next = head
            head?.next = tmp
        }
    }
}

func creatList(_ array: [Int]) -> ListNode? {
    if array.isEmpty {
        return nil
    }
    let head = ListNode(array.first!)
    var p = head
    for value in array.dropFirst() {
        p.next = ListNode(value)
        if let q = p.next {
            p = q
        }
    }
    return head
}

func printList(_ l: ListNode?) {
    var dummy = l
    while dummy != nil {
        print("node val: \(String(describing: dummy?.val))")
        dummy = dummy?.next
    }
}

/*
 合并两个有序链表
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else {
        return l2
    }
    guard let l2 = l2 else {
        return l1
    }
    if l1.val <= l2.val {
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    } else {
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
    }
}

 
class LinkedList : CommonOpsProtocol {
    
    func testCase() {
        let l1 = creatList([1, 3, 3, 3, 7, 9, 19])
//        printList(l1)
        let l2 = creatList([2, 4, 6])
//        printList(l2)
        let l3 = mergeTwoLists(l1, l2)
        printList(l3)
        
    }
    
}






