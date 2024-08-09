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
        var previousNode: ListNode? = nil
        var currentNode = head
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        return previousNode
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var stack = [ListNode]()
        var head = head
        while head != nil {
            stack.append(head!)
            if head?.next == nil { break }
            head = head?.next
        }
        while !stack.isEmpty {
            let popNode = stack.removeLast()
            popNode.next = stack.last
        }
        return head
    }
}
