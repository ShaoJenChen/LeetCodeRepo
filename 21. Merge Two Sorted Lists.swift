//
//  21. Merge Two Sorted Lists.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.
 */
/**
 Example:
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil, l2 != nil { return l2 }
        if l2 == nil, l1 != nil { return l1 }
        if l1 == nil, l2 == nil { return nil }
        
        var firstList: ListNode! = l1
        var secondList: ListNode! = l2
        
        var newList: ListNode?
        
        var head: ListNode?
        
        while firstList != nil ,secondList != nil {
            
            if newList == nil {
                if firstList.val <= secondList.val {
                    newList = firstList
                    firstList = firstList.next
                } else {
                    newList = secondList
                    secondList = secondList.next
                }
                
                head = newList
            }
            if firstList == nil || secondList == nil {
                break
            }
            
            if firstList.val <= secondList.val {
                newList?.next = firstList
                newList = newList?.next
                firstList = firstList.next
            }
            else {
                newList?.next = secondList
                newList = newList?.next
                secondList = secondList.next
            }
            
        }
        
        if firstList == nil {
            newList?.next = secondList
        } else if secondList == nil {
            newList?.next = firstList
        }
        
        return head
    }
}
