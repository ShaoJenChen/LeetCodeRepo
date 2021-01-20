//
//  83. Remove Duplicates from Sorted List.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 */
/**
 Example 1:
 Input: 1->1->2
 Output: 1->2
 
 Example 2:
 Input: 1->1->2->3->3
 Output: 1->2->3
 */

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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        while current != nil ,current?.next != nil {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            }
            else {
                current = current?.next
            }
        }
        return head
    }
}
