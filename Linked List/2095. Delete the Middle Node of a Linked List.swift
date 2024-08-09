//
//  2095. Delete the Middle Node of a Linked List.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation

class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        var node = head
        var n = 0
        while node != nil {
            n += 1
            node = node?.next
        }
        let middle = n/2
        let previousMiddleIndex = middle - 1
        //edge case
        guard n != 1 else { return nil }

        n = 0
        node = head
        var previousMiddleNode: ListNode?
        while node != nil {
            if n == previousMiddleIndex {
                node?.next = node?.next?.next
                break
            }
            n += 1
            node = node?.next
        }
        return head
    }
}
