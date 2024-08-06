//
//  1448. Count Good Nodes in Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation

//O(n)
class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        var count = 0
        func dfs(_ node: TreeNode?, _ currentMax: Int) {
            guard let node else { return }
            if node.val >= currentMax { count += 1 }
            let maxSofar = max(node.val, currentMax)
            dfs(node.left, maxSofar)
            dfs(node.right, maxSofar)
        }
        dfs(root, Int.min)
        return count
    }
}

//O(n * layer of node)
class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        var count = 0
        var visited = [Int]()
        func dfs(_ node: TreeNode?) {
            guard let node else { return }
            var isGoodNode = true
            for visitedVal in visited {
                if visitedVal > node.val { isGoodNode = false }
            }
            if isGoodNode { count += 1 }
            visited.append(node.val)
            dfs(node.left)
            dfs(node.right)
            visited.removeLast()
        }
        dfs(root)
        return count
    }
}
