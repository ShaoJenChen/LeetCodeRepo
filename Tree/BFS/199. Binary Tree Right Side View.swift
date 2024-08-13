//
//  199. Binary Tree Right Side View.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        //BFS
        //each layer append the right child to array first v
        //map [layer int: [Int]] -> [layer int: Int] v
        //map.keys.sort for loop -> each element append to result array  v
        //queue (layer: Int, value: Int) x
        //array [[Int]]  ?? x
        //edge case root nil
        //Time: BFS traversal O(n) where n is tree nodes count
        guard let root else { return [] }
        var map = [Int: Int]()
        var queue = [(layer: Int, node: TreeNode)]()
        queue.append((0, root))
        while !queue.isEmpty {
            let currentElement = queue.removeFirst()
            let currentNode = currentElement.node
            let currentLayer = currentElement.layer
            let value = currentNode.val
            if map[currentLayer] == nil {
                map[currentLayer] = value
            }
            if let right = currentNode.right {
                queue.append((currentLayer + 1, right))
            }
            if let left = currentNode.left {
                queue.append((currentLayer + 1, left))
            }
        }
        let result = map.sorted(by: { $0.key < $1.key }).map({$0.value})
        return result
    }
}
