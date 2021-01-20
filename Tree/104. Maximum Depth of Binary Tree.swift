//
//  104. Maximum Depth of Binary Tree.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
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
    func maxDepth(_ root: TreeNode?) -> Int {
        var depth = 0
        var maxDepth = 0
        
        func preorder(node: TreeNode?, depth: inout Int, maxDepth: inout Int) {
            guard let node = node else { return }
            depth += 1
            
            preorder(node: node.left, depth: &depth, maxDepth: &maxDepth)
            
            preorder(node: node.right, depth: &depth, maxDepth: &maxDepth)
            
            //leaf
            if node.left == nil, node.right == nil {
                maxDepth = max(maxDepth, depth)
            }
            depth -= 1
        }
        
        preorder(node: root, depth: &depth, maxDepth: &maxDepth)
        
        return maxDepth
    }
}
