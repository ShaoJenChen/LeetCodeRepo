//
//  938. Range Sum of BST.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/11.
//

//Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].

import Foundation

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var valArr = [Int]()

        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            valArr.append(node.val)
            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)

        let resutl = valArr.filter({ $0 >= low && $0 <= high }).reduce(0, +)

        return resutl
        
    }
}
