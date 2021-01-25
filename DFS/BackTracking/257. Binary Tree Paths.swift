//
//  257. Binary Tree Paths.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/25.
//

//Given a binary tree, return all root-to-leaf paths.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Input:
//
//   1
// /   \
//2     3
// \
//  5
//
//Output: ["1->2->5", "1->3"]
//
//Explanation: All root-to-leaf paths are: 1->2->5, 1->3

import Foundation

class Solution {
    func DFS(node: TreeNode?, path: inout [Int], result: inout [String]) {
        guard let node = node else { return }
        path.append(node.val)
        DFS(node: node.left, path: &path, result: &result)//left
        DFS(node: node.right, path: &path, result: &result)//right
        if node.left == nil && node.right == nil { //leaf
            var pathStr = ""
            for (index, element) in path.enumerated() {
                pathStr += String(element)
                if index != path.count - 1 {
                    pathStr += "->"
                }
            }
            result.append(pathStr)
        }
        path.removeLast()
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [String]()
        var path = [Int]()
        DFS(node: root, path: &path, result: &result)
        return result
    }
}
