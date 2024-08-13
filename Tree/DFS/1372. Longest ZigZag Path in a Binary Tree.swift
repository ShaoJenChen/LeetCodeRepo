//
//  1372. Longest ZigZag Path in a Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func longestZigZag(_ root: TreeNode?) -> Int {
        //any node, current node is left/right
        //current node path count, and each node start from 0, append to stack with path count + 1
        //if current is left/right then visit right/left child, if righ/left is not exist means path end,
        //max(maxPathLength, currentPathCount)
        //DFS
        //Time: O(n)
        
        guard let root else { return 0 }
        var stack = [(node: TreeNode, isRight: Bool, pathLength: Int)]()
        if let rootRight = root.right {
            stack.append((rootRight, true, 1))
        }
        if let rootLeft = root.left {
            stack.append((rootLeft, false, 1))
        }
        var maxPathLength = 0
        while !stack.isEmpty {
            let element = stack.popLast()!
            let currentNode = element.node
            let isCurrentRight = element.isRight
            let currentLength = element.pathLength
            
            //means path end
            if isCurrentRight && currentNode.left == nil || !isCurrentRight && currentNode.right == nil {
                maxPathLength = max(maxPathLength, currentLength)
            }

            if isCurrentRight {
                if currentNode.left != nil {
                    stack.append((currentNode.left!, false, currentLength + 1))
                }
                if let nodeRight = currentNode.right {
                    stack.append((nodeRight, true, 1))
                }
            }
            else {
                if currentNode.right != nil {
                    stack.append((currentNode.right!, true, currentLength + 1))
                }
                if let nodeLeft = currentNode.left {
                    stack.append((nodeLeft, false, 1))
                }
            }
        }

        return maxPathLength
    }
}
