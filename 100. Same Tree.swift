//
//  100. Same Tree.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 */
/**
 Example 1:

 Input:     1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 Output: true
 
 Example 2:

 Input:     1         1
           /           \
          2             2

         [1,2],     [1,null,2]

 Output: false
 
 Example 3:

 Input:     1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 Output: false
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var valuesP = [Int?]()
        var valuesQ = [Int?]()
        
        func preorder(node: TreeNode?, values: inout [Int?]) {
            
            if let rootValue = node?.val {
                values.append(rootValue)
            }
            
            if let leftNode = node?.left {
                preorder(node: leftNode, values: &values)
            }
            else {
                values.append(nil)
            }
            
            if let rightNode = node?.right {
                preorder(node: rightNode, values: &values)
            }
            else {
                values.append(nil)
            }
            
        }
        
        preorder(node: p, values: &valuesP)
        preorder(node: q, values: &valuesQ)
        
        return valuesP == valuesQ
    }
}
