//
//  112. Path Sum.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

 Note: A leaf is a node with no children.
*/
/**
 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        guard root != nil else { return false }
        
        var summary = 0
        var resultArray = [Bool]()
        
        func preorder(node: TreeNode?, summary: inout Int, resultArr: inout [Bool]) {
            
            if let node = node {
                summary += node.val
            }
            
            //leaf
            if node?.left == nil, node?.right == nil {
                if summary == sum {
                    resultArr.append(true)
                }
            }
            
            if let leftNode = node?.left {
                preorder(node: leftNode, summary: &summary, resultArr: &resultArr)
                summary -= leftNode.val
            }
            
            if let rightNode = node?.right {
                preorder(node: rightNode, summary: &summary, resultArr: &resultArr)
                summary -= rightNode.val
            }
                        
        }
        
        preorder(node: root, summary: &summary, resultArr: &resultArray)
        
        return resultArray.contains(true)
        
    }
}
