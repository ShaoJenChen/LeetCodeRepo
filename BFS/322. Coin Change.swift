//
//  322. Coin Change.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/2.
//

import Foundation

//BFS
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount != 0 else { return 0 }
        var queue = [(sum: Int, count: Int)]()
        var visited = Set<Int>()
        for coin in coins {
            queue.append((coin, 1))
            visited.insert(coin)
        }
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if current.sum == amount { return current.count }
            
            for coin in coins {
                let sum = current.sum + coin
                guard sum <= amount else { continue }
                guard !visited.contains(sum) else { continue }
                queue.append((sum, current.count + 1))
                visited.insert(sum)
            }
        }
        return -1
    }
}
