//
//  145. Binary Tree Postorder Traversal.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/3.
//

import Foundation


class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var result = [Int]()
        func preorder(_ node: TreeNode) {
            if let left = node.left {
                preorder(left)
            }
            if let right = node.right {
                preorder(right)
            }
            result.append(node.val)
        }
        preorder(root)
        return result
    }
}
