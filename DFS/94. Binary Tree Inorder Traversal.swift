//
//  94. Binary Tree Inorder Traversal.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/20.
//

//Given the root of a binary tree, return the inorder traversal of its nodes' values.

//Example 1:
//   1
//    \
//     2
//    /
//   3

//Input: root = [1,null,2,3]
//Output: [1,3,2]

//Constraints:
//The number of nodes in the tree is in the range [0, 100].
//-100 <= Node.val <= 100

import Foundation

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var result = [Int]()
        
        func dfs(node: TreeNode?) {
            guard let currentNode = node else { return }
            dfs(node: currentNode.left)
            result.append(currentNode.val)
            dfs(node: currentNode.right)
        }

        dfs(node: root)
        
        return result
    }
}
