//
//  700. Search in a Binary Search Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else { return nil }
        if node.val == val { return node }
        while node.val != val {
            if node.val > val {
                return searchBST(node.left, val)
            }
            else if node.val < val {
                return searchBST(node.right, val)
            }
        }
        return nil
    }
}
