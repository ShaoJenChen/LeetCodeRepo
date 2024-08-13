//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/27.
//
//


// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree

import Foundation


//BFS
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        //BFS
        var parantMap = [Int: TreeNode]()
        var queue = [(node: TreeNode?, parantNode: TreeNode?)]()
        queue.append((root, nil))
        while !queue.isEmpty {
            let currentElement = queue.removeFirst()
            guard let currentNode = currentElement.node else { continue }
            let parantNode = currentElement.parantNode
            parantMap[currentNode.val] = parantNode
            
            if let leftNode = currentNode.left {
                queue.append((leftNode, currentNode))
            }
            if let rightNode = currentNode.right {
                queue.append((rightNode, currentNode))
            }
        }
        var p = p
        var q = q
        var ancestors = [TreeNode]()
        while p != nil {
            ancestors.append(p!)
            p = parantMap[p!.val]
        }
        
        while q != nil {
            if ancestors.contains(where: { $0.val == q!.val }) { break }
            q = parantMap[q!.val]
        }
        return q
    }
}





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
