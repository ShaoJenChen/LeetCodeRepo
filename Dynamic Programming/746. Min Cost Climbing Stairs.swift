//
//  746. Min Cost Climbing Stairs.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/19.
//

import Foundation

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
       //base case cost[0] or cost[1]
        //climb 1 or 2 steps, dp[i] = cost[i] + min(dp[i-1], dp[i-2])
        //bottom-up
        
        var dp = Array(repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        for i in 2 ..< cost.count {
            dp[i] = cost[i] + min(dp[i-1], dp[i-2])
        }
        return min(dp[cost.count - 1], dp[cost.count - 2])
    }
}


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
