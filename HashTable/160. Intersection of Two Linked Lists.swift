//
//  160. Intersection of Two Linked Lists.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/22.
//


//Write a program to find the node at which the intersection of two singly linked lists begins.
//
//
//https://leetcode.com/problems/intersection-of-two-linked-lists/
//網址看題目圖片

import Foundation

extension ListNode: Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var map = Set<ListNode>()
        
        var cursorA: ListNode? = headA
        var cursorB: ListNode? = headB
        while cursorA != nil {
            map.insert(cursorA!)
            cursorA = cursorA?.next
        }
        while cursorB != nil {
            if map.contains(cursorB!) {
                return cursorB
            }
            cursorB = cursorB?.next
        }
        return nil
    }
}
