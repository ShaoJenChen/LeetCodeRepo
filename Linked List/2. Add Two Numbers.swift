//
//  2. Add Two Numbers.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/12.
//

import Foundation

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example 1:
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.
//
//Example 2:
//Input: l1 = [0], l2 = [0]
//Output: [0]
//
//Example 3:
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]

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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var currentL1 = l1
        var currentL2 = l2
        
        var carryDigit = 0
        
        var resultArr = [ListNode]()
        
        //先處理同時都有值的情況
        while (currentL1 != nil && currentL2 != nil) {
            
            let sum = currentL1!.val + currentL2!.val
            
            let currentDigit = (sum + carryDigit) % 10
            resultArr.append(ListNode(currentDigit))
            carryDigit = (sum + carryDigit) / 10
            
            currentL1 = currentL1!.next
            currentL2 = currentL2!.next
        }
        
        //再處理剩下的值
        if currentL1 == nil {
            
            while (currentL2 != nil) {
                
                let sum = carryDigit + currentL2!.val
                
                let currentDigit = sum % 10
                resultArr.append(ListNode(currentDigit))
                carryDigit = sum / 10
                
                currentL2 = currentL2!.next
            }
        }
        else if currentL2 == nil {
            
            while (currentL1 != nil) {
                
                let sum = carryDigit + currentL1!.val
                
                let currentDigit = sum % 10
                resultArr.append(ListNode(currentDigit))
                carryDigit = sum / 10
                
                currentL1 = currentL1!.next
            }
            
        }
        
        //最後處理進位位元值若還有值的情況
        if carryDigit != 0 {
            resultArr.append(ListNode(1))
        }
        
        //先將第一個Node取出，最後會回傳這一個
        let firstNode = resultArr.first
        var currentNode = firstNode
        var currentIndex = 0
        //將每個元素連結起來
        while(currentIndex + 1 < resultArr.count) {
            let nextNode = resultArr[currentIndex+1]
            currentNode!.next = nextNode
            currentNode = nextNode
            currentIndex += 1
        }
        
        return firstNode
    }
        
}

class Solution {
    private var dig = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && dig == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
        dig = sum / 10
        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}
