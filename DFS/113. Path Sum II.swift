//
//  113. Path Sum II.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/14.
//

import Foundation

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {

        var currentSum = 0
        var currentValues = [Int]()
        var resultValues = [[Int]]()

        func preorder(_ node: TreeNode?) {
            guard let node else { return }

            currentSum += node.val
            currentValues.append(node.val)

            //leaf
            if node.left == nil && node.right == nil,
                currentSum == targetSum {
                    resultValues.append(currentValues)
            }

            preorder(node.left)
            preorder(node.right)

            currentSum -= node.val
            currentValues.removeLast()
            
        }

        preorder(root)

        return resultValues

    }
}
