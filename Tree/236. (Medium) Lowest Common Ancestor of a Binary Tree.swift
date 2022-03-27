//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/27.
//
//


// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree

import Foundation

class Solution {
    
    var pVal: Int!
    var qVal: Int!
    
    var resultNode: TreeNode?
    
    func dfs(node: TreeNode?) -> Bool {
        
        guard let node = node else { return false }
        
        var mid = (node.val == self.pVal) || (node.val == self.qVal)
        
        let leftBranch = dfs(node: node.left)
        
        let rightBranch = dfs(node: node.right)
        
        if (leftBranch && rightBranch) {
            self.resultNode = node
        }
        if (leftBranch || rightBranch) && (mid == true) {
            self.resultNode = node
        }
        
        return (leftBranch || rightBranch || mid)

    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

        self.pVal = p!.val
        self.qVal = q!.val
        
        let _ = dfs(node: root)
        
        return self.resultNode
        
    }
}
