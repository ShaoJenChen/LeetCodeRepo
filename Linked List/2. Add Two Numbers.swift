//
//  2. Add Two Numbers.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/12.
//

import Foundation

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example 1:
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.
//
//Example 2:
//Input: l1 = [0], l2 = [0]
//Output: [0]
//
//Example 3:
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var resultHeadNode = ListNode(0)
        var currentNode: ListNode? = resultHeadNode

        var l1 = l1
        var l2 = l2
        var carry = 0
        while l1 != nil || l2 != nil || carry != 0 {
            let l1Value = l1 == nil ? 0 : l1!.val
            let l2Value = l2 == nil ? 0 : l2!.val
            var sum = l1Value + l2Value + carry
            let newNode = ListNode(sum % 10)
            carry = sum / 10
            currentNode?.next = newNode
            currentNode = currentNode?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return resultHeadNode.next
    }
        
}
