//
//  116. Populating Next Right Pointers in Each Node.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/30.
//

import Foundation


class Solution {
    func connect(_ root: Node?) -> Node? {
        
        guard let root else { return nil }

        var queue = [(Node, Int)]()
        queue.append((root, 0))
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            let node = element.0
            let layer = element.1
            if let left = node.left {
                queue.append((left, layer + 1))
            }
            if let right = node.right {
                queue.append((right, layer + 1))
            }
            let nextNodeWithSameLayer = queue.first(where: { $0.1 == layer })?.0
            node.next = nextNodeWithSameLayer
        }
        return root
    }
}
