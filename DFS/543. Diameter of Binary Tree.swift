//
//  543. Diameter of Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/23.
//

import Foundation

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var longestDiameter = 0

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let leftTreePath = dfs(node.left)
            let rightTreePath = dfs(node.right)
            let currentNodeDiameter = leftTreePath + rightTreePath
            longestDiameter = max(longestDiameter, currentNodeDiameter)
            return max(leftTreePath, rightTreePath) + 1
        }
        dfs(root)
        return longestDiameter
    }
}
