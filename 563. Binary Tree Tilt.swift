//
//  563. Binary Tree Tilt.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/9.
//

import Foundation

//Given the root of a binary tree, return the sum of every tree node's tilt.
//
//The tilt of a tree node is the absolute difference between the sum of all left subtree node values and all right subtree node values. If a node does not have a left child, then the sum of the left subtree node values is treated as 0. The rule is similar if there the node does not have a right child.

//Input: root = [1,2,3]
//Output: 1
//Explanation:
//Tilt of node 2 : |0-0| = 0 (no children)
//Tilt of node 3 : |0-0| = 0 (no children)
//Tile of node 1 : |2-3| = 1 (left subtree is just left child, so sum is 2; right subtree is just right child, so sum is 3)
//Sum of every tilt : 0 + 0 + 1 = 1

//     1
//   /   \
//  2     3

//     1
//   /   \
//  0     0


//Input: root = [4,2,9,3,5,null,7]
//Output: 15
//Explanation:
//Tilt of node 3 : |0-0| = 0 (no children)
//Tilt of node 5 : |0-0| = 0 (no children)
//Tilt of node 7 : |0-0| = 0 (no children)
//Tilt of node 2 : |3-5| = 2 (left subtree is just left child, so sum is 3; right subtree is just right child, so sum is 5)
//Tilt of node 9 : |0-7| = 7 (no left child, so sum is 0; right subtree is just right child, so sum is 7)
//Tilt of node 4 : |(3+5+2)-(9+7)| = |10-16| = 6 (left subtree values are 3, 5, and 2, which sums to 10; right subtree values are 9 and 7, which sums to 16)
//Sum of every tilt : 0 + 0 + 0 + 2 + 7 + 6 = 15


//       4
//     /   \
//    2     9
//  /   \    \
// 3     5    7

//       6
//     /   \
//    2     7
//  /   \    \
// 0     0    0


//Input: root = [21,7,14,1,1,2,2,3,3]
//Output: 9

//        21
//      /    \
//     7      14
//    / \    /  \
//   1   1  2    2
//  / \
// 3   3

//        3
//      /   \
//     6     0
//    / \   / \
//   0   0 0   0
//  / \
// 0   0

//Constraints:
//
//The number of nodes in the tree is in the range [0, 104].
//-1000 <= Node.val <= 1000


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
    
    var result = 0
    
    func findTilt(_ root: TreeNode?) -> Int {
        dfs(root)
        return result
    }
    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        var l = dfs(node.left)
        var r = dfs(node.right)
        result += abs(l - r)
        return l + r + node.val
    }
}
