//
//  314. Binary Tree Vertical Order Traversal.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/8.
//

//Given the root of a binary tree, return the vertical order traversal of its nodes' values. (i.e., from top to bottom, column by column).
//
//If two nodes are in the same row and column, the order should be from left to right.

import Foundation

class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var map = [Int: [Int]]()
        //BFS
        var queue = [(TreeNode, Int)]()
        guard let root = root else { return [[Int]]() }
        queue.append((root, 0))
        while !queue.isEmpty {
            let item = queue.removeFirst()
            let node = item.0
            let col = item.1
            map[col, default: []].append(node.val)
            if node.left != nil {
                queue.append((node.left!, col - 1))
            }
            if node.right != nil {
                queue.append((node.right!, col + 1))
            }
        }
        let result = map.sorted(by: { $0.key < $1.key }).map({ $0.value })
        return result
    }
}
