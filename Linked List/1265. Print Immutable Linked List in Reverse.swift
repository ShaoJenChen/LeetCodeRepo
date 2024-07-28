//
//  1265. Print Immutable Linked List in Reverse.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/27.
//

import Foundation


/**
 * Definition for ImmutableListNode.
 * public class ImmutableListNode {
 *     public func printValue() {}
 *     public func getNext() -> ImmutableListNode? {}
 * }
 */

class Solution {
    func printLinkedListInReverse(_ head: ImmutableListNode?) {
        guard let head else { return }
        if let nextNode = head.getNext() {
            printLinkedListInReverse(nextNode)
            head.printValue()
        }
        else {
            head.printValue()
        }
    }
}
