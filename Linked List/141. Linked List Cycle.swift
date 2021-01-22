//
//  141. Linked List Cycle.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/22.
//

import Foundation

//Floyd Cycle Detection Algorithm
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        var slow = head
        var fast = head?.next
        while !(slow === fast) {
            if fast == nil || slow == nil {
                return false
            }
            else {
                slow = slow?.next
                fast = fast?.next?.next
            }
        }
        return true
    }
}
