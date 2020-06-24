//
//  111. Minimum Depth of Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2020/6/24.
//

import Foundation
/**
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its minimum depth = 2.
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        if let left = node.left, let right = node.right {
            return 1 + min(minDepth(left), minDepth(right))
        }
        if let left = node.left {
            return 1 + minDepth(left)
        }
        if let right = node.right {
            return 1 + minDepth(right)
        }
        return 1
    }
}
