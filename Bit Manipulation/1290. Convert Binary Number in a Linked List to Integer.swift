//
//  1290. Convert Binary Number in a Linked List to Integer.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/24.
//

//Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.
//
//Return the decimal value of the number in the linked list.
//
//Example 1:
//Input: head = [1,0,1]
//Output: 5
//Explanation: (101) in base 2 = (5) in base 10
//Example 2:
//
//Input: head = [0]
//Output: 0
//Example 3:
//
//Input: head = [1]
//Output: 1
//Example 4:
//
//Input: head = [1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]
//Output: 18880
//Example 5:
//
//Input: head = [0,0]
//Output: 0


import Foundation

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var result = 0
        var currentNode: ListNode! = head
        while currentNode != nil {
            result = result | currentNode.val
            if currentNode.next != nil {
                result = result << 1
                currentNode = currentNode.next
            }
            else {
                break
            }
        }
        return result
    }
}
