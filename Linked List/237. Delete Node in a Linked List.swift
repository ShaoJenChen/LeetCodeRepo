//
//  237. Delete Node in a Linked List.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/22.
//


//Write a function to delete a node in a singly-linked list. You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.
//
//It is guaranteed that the node to be deleted is not a tail node in the list.

//Input: head = [4,5,1,9], node = 5
//Output: [4,1,9]
//Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.

//Input: head = [1,2,3,4], node = 3
//Output: [1,2,4]
//
//Input: head = [0,1], node = 0
//Output: [1]

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func deleteNode(_ node: ListNode?) {
        
        var cursorNode = node
        var previousNode: ListNode?
        
        while cursorNode != nil {
            if cursorNode?.next != nil {
                cursorNode?.val = cursorNode!.next!.val
            }
            if cursorNode?.next == nil {
                previousNode?.next = nil
            }
            previousNode = cursorNode
            cursorNode = cursorNode?.next
        }
        
    }
}
