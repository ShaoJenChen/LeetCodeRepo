//
//  746. Min Cost Climbing Stairs.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/19.
//

import Foundation

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var map = [Int: Int]()
        func dp(_ n: Int) -> Int {
            if n == 0 { return 0 }
            if n == 1 { return 0 }
            if let value = map[n] { return value }
            let result = min(dp(n - 1) + cost[n - 1], dp(n - 2) + cost[n - 2])
            map[n] = min(map[n, default: Int.max], result)
            return result
        }
        let n = cost.count
        let minCost = dp(n)
        return minCost
    }
}
