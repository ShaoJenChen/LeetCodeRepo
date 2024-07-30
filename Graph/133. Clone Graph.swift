//
//  133. Clone Graph.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/29.
//

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {

    var visited = [Node: Node]()
    
    func cloneGraph(_ node: Node?) -> Node? {
        
        guard let node else { return nil }

        if let clonedNode = visited[node] {
            return clonedNode
        }

        let newNode = Node(node.val)
        visited[node] = newNode

        for neighbor in node.neighbors {
            newNode.neighbors.append(cloneGraph(neighbor))
        }

        return newNode
    }
}
