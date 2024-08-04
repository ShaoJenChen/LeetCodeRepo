//
//  144. Binary Tree Preorder Traversal.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/3.
//

import Foundation

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var result = [Int]()
        func preorder(_ node: TreeNode) {
            result.append(node.val)
            if let left = node.left {
                preorder(left)
            }
            if let right = node.right {
                preorder(right)
            }
        }
        preorder(root)
        return result
    }
}
