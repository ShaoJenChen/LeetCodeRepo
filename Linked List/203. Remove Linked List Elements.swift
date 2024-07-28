//
//  203. Remove Linked List Elements.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/28.
//

import Foundation

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var sentinel = ListNode(0)
        sentinel.next = head
        var prevNode = sentinel
        var currentNode = head

        while currentNode != nil {
            if currentNode!.val == val {
                prevNode.next = currentNode?.next
            }
            else {
                prevNode = currentNode!
            }
            currentNode = currentNode?.next
        }

        return sentinel.next
    }
    
}
