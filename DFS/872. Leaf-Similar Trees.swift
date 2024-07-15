//
//  872. Leaf-Similar Trees.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation


class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func dfs(_ node: TreeNode?, _ leafSequence: inout [Int]) {
            guard let node else { return }
            //leaf
            if node.left == nil,
                node.right == nil {
                    leafSequence.append(node.val)
                    return
                }
            dfs(node.left, &leafSequence)
            dfs(node.right, &leafSequence)
        }
        var tree1Sequence = [Int]()
        var tree2Sequence = [Int]()
        dfs(root1, &tree1Sequence)
        dfs(root2, &tree2Sequence)

        return tree1Sequence == tree2Sequence
    }
}
