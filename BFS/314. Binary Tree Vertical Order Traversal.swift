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
        
        var columnTable = [Int: [Int]]()
        var queue = [(TreeNode, Int)]()
        var result = [[Int]]()

        guard let root = root else { return []}
        queue.append((root, 0))

        while !queue.isEmpty {
            let (node, column) = queue.removeFirst()
            columnTable[column, default: []].append(node.val)
            if let left = node.left {
                queue.append((left, column - 1))
            }
            if let right = node.right {
                queue.append((right, column + 1))
            }
        }
        for key in columnTable.keys.sorted() {
            result.append(columnTable[key]!)
        }

        return result
    }
}
