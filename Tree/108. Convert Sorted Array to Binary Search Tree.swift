//
//  108. Convert Sorted Array to Binary Search Tree.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/24.
//

import Foundation
/**
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted array: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    static func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        let leftIndex = 0
        let rightIndex = nums.count - 1
        
        func createNode(left: Int, right: Int) -> TreeNode? {
            guard right >= left else { return nil }
            let midIndex = (left + right)/2
            let node = TreeNode(nums[midIndex])
            let leftNode = createNode(left: left, right: midIndex - 1)
            let rightNode = createNode(left: midIndex + 1, right: right)
            node.left = leftNode
            node.right = rightNode
            return node
        }
        let root = createNode(left: leftIndex, right: rightIndex)
        return root
    }
}
