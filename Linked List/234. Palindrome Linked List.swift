//
//  234. Palindrome Linked List.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/20.
//

import Foundation

//Given a singly linked list, determine if it is a palindrome.
//
//Example 1:
//
//Input: 1->2
//Output: false
//Example 2:
//
//Input: 1->2->2->1
//Output: true
//Follow up:
//Could you do it in O(n) time and O(1) space?

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    static func isPalindrome(_ head: ListNode?) -> Bool {
        var nums = [Int]()
        var currentNode = head
        while currentNode != nil {
            nums.append(currentNode!.val)
            currentNode = currentNode?.next
        }
        
        currentNode = head
        
        while nums.count != 0 {
            
            if let currentNode = currentNode,
               nums.last != currentNode.val {
                return false
            }
            currentNode = currentNode?.next
            nums.popLast()
        }
        return true
    }
}
