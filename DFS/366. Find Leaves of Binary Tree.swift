//
//  366. Find Leaves of Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/22.
//

import Foundation

class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()

        func calulateHeight(_ node: TreeNode?) -> Int {
            guard let node = node else { return -1 }

            var leftTreeHeight = calulateHeight(node.left)
            var rightTreeHeight = calulateHeight(node.right)

            var height = max(leftTreeHeight, rightTreeHeight) + 1

            if result.count == height {
                result.append([node.val])
            }
            else {
                result[height].append(node.val)
            }

            return height
        }

        calulateHeight(root)

        return result
    }
}
