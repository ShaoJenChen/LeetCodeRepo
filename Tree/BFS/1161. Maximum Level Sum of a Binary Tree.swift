//
//  1161. Maximum Level Sum of a Binary Tree.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        //every layer sum, max sum, if sum is equal return smalllest
        //map [layer: int array] => [layer: sum Int]
        //layer 1 -> n
        //result => (maxSum, Layer) => if current sum > result.maxSum update result
        // array of each layer sum => [(layer, sum)]
        // if current sum == result.maxSum update layer by min func
        //return result layer
        //BFS
        //Time: Traversal all node O(n), for loop layer O(m)
        //O(n+m)
        //Sapce: map O(m) array O(m)
        //O(m)
        guard let root else { return 0 }
        var map = [Int: Int]()
        var queue = [(layer: Int, node: TreeNode)]()
        queue.append((1, root))
        while !queue.isEmpty {
            let currentElement = queue.removeFirst()
            let currentLayer = currentElement.layer
            let currentNode = currentElement.node
            map[currentLayer, default: 0] += currentNode.val
            if let right = currentNode.right {
                queue.append((currentLayer + 1, right))
            }
            if let left = currentNode.left {
                queue.append((currentLayer + 1, left))
            }
        }
        var result: (maxSum: Int, layer: Int) = (Int.min, 0)
        for element in map {
            if element.value > result.maxSum {
                result.maxSum = element.value
                result.layer = element.key
            }
            else if element.value == result.maxSum {
                result.layer = min(result.layer, element.key)
            }
        }
        return result.layer
    }
}
