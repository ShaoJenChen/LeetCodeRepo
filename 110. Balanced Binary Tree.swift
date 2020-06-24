//
//  110. Balanced Binary Tree.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/24.
//

import Foundation
/**
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:

 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
 */
/**
 Example 1:

 Given the following tree [3,9,20,null,null,15,7]:

     3
    / \
   9  20
     /  \
    15   7
 Return true.

 Example 2:

 Given the following tree [1,2,2,3,3,null,null,4,4]:

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 Return false.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        func height(node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            return 1 + max(height(node: node.left), height(node: node.right))
        }
        
        let subTreeDeltaHeight = height(node: root.left) - height(node: root.right)
        
        if -1...1 ~= subTreeDeltaHeight {
            return isBalanced(root.left) && isBalanced(root.right)
        }
        return false
    }
}
