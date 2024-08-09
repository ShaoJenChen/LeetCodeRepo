//
//  328. Odd Even Linked List.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation


class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        //edge case
        guard let head else { return nil }
        var oddHead: ListNode? = head
        var evenHead = head.next
        let firstEvenHead = evenHead
        while oddHead?.next != nil && evenHead?.next != nil {
            oddHead?.next = evenHead?.next
            oddHead = oddHead?.next
            evenHead?.next = oddHead?.next
            evenHead = evenHead?.next
        }
        oddHead?.next = firstEvenHead
        return head
    }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        //edge case
        guard let head else { return nil }
        guard head.next != nil else { return head }
        var node: ListNode? = head
        var index = 0
        var oddNodes = [ListNode]()
        while node != nil {
            if index % 2 != 0 {
                oddNodes.append(node!)
            }
            index += 1
            node = node?.next
        }
        node = head
        while node != nil {
            node?.next = node?.next?.next
            if node?.next == nil { break }
            node = node?.next
        }
        //edge case
        if oddNodes.count == 1 {
            oddNodes[0].next = nil
        }
        for index in 1 ..< oddNodes.count {
            oddNodes[index].next = nil
            oddNodes[index - 1].next = oddNodes[index]
        }
        node?.next = oddNodes.first
        return head
    }
}
