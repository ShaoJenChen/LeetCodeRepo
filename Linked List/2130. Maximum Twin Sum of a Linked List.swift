//
//  2130. Maximum Twin Sum of a Linked List.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/9.
//

import Foundation

//fast slow pointer
//reverse Linked List

class Solution {
    func pairSum(_ head: ListNode?) -> Int {
        //two pointer to find middle
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        //reverse half of nodes
        //current slow is the head of half ListNode
        var previousNode: ListNode?
        while slow != nil {
            var nextNode = slow?.next
            slow?.next = previousNode
            previousNode = slow
            slow = nextNode
        }
        //after reverse half ListNode, previousNode is the original last node
        var start_1 = head
        var start_2 = previousNode
        var maxTwinSum = 0
        while start_2 != nil {
            maxTwinSum = max(start_1!.val + start_2!.val, maxTwinSum)
            start_1 = start_1?.next
            start_2 = start_2?.next
        }
        return maxTwinSum
    }
}
