//
//  279. Perfect Squares.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/2.
//

import Foundation

//BFS
class Solution {
    func numSquares(_ n: Int) -> Int {
        var visited = Set<Int>()
        var queue = [(number: Int, count: Int)]()
        let sqrtN = sqrt(Double(n))
        for i in 1 ... Int(sqrtN) {
            queue.append((i * i, 1))
            visited.insert(i * i)
        }
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if current.number == n { return current.count }
            for i in 1 ... Int(sqrtN) {
                let nextNumber = (i * i) + current.number
                guard !visited.contains(nextNumber) else { continue }
                guard nextNumber <= n else { continue }
                queue.append((nextNumber, current.count + 1))
                visited.insert(nextNumber)
            }
        }
        return n
    }
}
