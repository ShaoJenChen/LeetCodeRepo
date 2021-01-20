//
//  206. Reverse Linked List.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/20.
//

import Foundation

//Reverse a singly linked list.
//
//Example:
//
//Input: 1->2->3->4->5->NULL
//Output: 5->4->3->2->1->NULL
//Follow up:
//
//A linked list can be reversed either iteratively or recursively. Could you implement both?

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var nodes = [ListNode?]()
        var currentNode = head
        while currentNode != nil {
            nodes.append(currentNode)
            currentNode = currentNode?.next
        }
        let head = nodes.last!
        while nodes.count != 0 {
            let last = nodes.popLast()!!
            
            if let nextLast = nodes.last {
                last.next = nextLast
            }
            else {
                last.next = nil
            }
        }
        return head
    }
}
