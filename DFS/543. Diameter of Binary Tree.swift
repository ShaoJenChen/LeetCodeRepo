//
//  543. Diameter of Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/23.
//

import Foundation

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        //這一題要求 diameter
        //題目敘述 The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
        //換句話說，每一個節點可以得知的最大diameter 就是其 左子樹 跟 右子樹 的最大深度 相加
        //用dfs recursive function
        //取得左子樹跟右子樹的最大深度，相加之後更新 longestDiameter
        //recursive function 要回傳的是目前節點的最大深度
        //這邊要注意的一點就是，自己到Parant node的深度 1，然後加上 左子樹 跟 右子樹 比較大的那一個，之後回傳
        var longestDiameter = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            let leftLongestPath = dfs(node.left)
            let rightLongestPath = dfs(node.right)
            let currentNodeDiameter = leftLongestPath + rightLongestPath
            longestDiameter = max(currentNodeDiameter, longestDiameter)
            let currentNodeLongestPath = max(leftLongestPath, rightLongestPath)
            return currentNodeLongestPath + 1
        }
        
        dfs(root)

        return longestDiameter
    }
}
