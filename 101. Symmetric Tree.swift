//
//  101. Symmetric Tree.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 
 But the following [1,2,2,null,3,null,3] is not:
   1
  / \
 2   2
  \   \
  3    3
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func invert(node: TreeNode?) {
            guard let node = node else { return }
            var tempNode: TreeNode?
            tempNode = node.left
            node.left = node.right
            node.right = tempNode
            invert(node: node.left)
            invert(node: node.right)
        }
        
        func produceValues(node: TreeNode?) -> [Int?] {
            var values = [Int?]()
            func preorder(node: TreeNode?, values: inout [Int?]) {
                guard let node = node else {
                    values.append(nil)
                    return }
                values.append(node.val)
                preorder(node: node.left, values: &values)
                preorder(node: node.right, values: &values)
            }
            preorder(node: node, values: &values)
            return values
        }
        
        let originalValues = produceValues(node: root)
        invert(node: root)
        let invertedValues = produceValues(node: root)
        
        return originalValues == invertedValues
    }
}
