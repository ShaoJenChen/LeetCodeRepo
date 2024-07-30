//
//  222. Count Complete Tree Nodes.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/29.
//

import Foundation

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return 1 + countNodes(root.left) + countNodes(root.right)
    }
}
