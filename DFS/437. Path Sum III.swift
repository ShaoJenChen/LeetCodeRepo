//
//  437. Path Sum III.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/14.
//

import Foundation

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var count = 0
        var prefixSums = [Int: Int]()
        var prefixSum = 0

        func preorder(_ node: TreeNode?) {
            guard let node else { return }

            prefixSum += node.val
            
            //from root to leaf
            if prefixSum == targetSum { count += 1 }
            
            //from middle of tree
            count += prefixSums[prefixSum - targetSum] ?? 0

            prefixSums[prefixSum, default: 0] += 1

            preorder(node.left)
            preorder(node.right)

            prefixSums[prefixSum, default: 0] -= 1
            prefixSum -= node.val
        }

        preorder(root)

        return count
    }
}
