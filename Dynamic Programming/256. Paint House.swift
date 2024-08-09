//
//  256. Paint House.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/21.
//

import Foundation


class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        // i > 0
        // dp[i][0] = costs[i][0] + min(costs[i-1][1], costs[i-1][2])
        // dp[i][1] = costs[i][1] + min(costs[i-1][0], costs[i-1][2])
        // dp[i][2] = costs[i][2] + min(costs[i-1][0], costs[i-1][1])
        //bottom up
        //base case dp[0] = costs[0]
        
        var dp = costs
        for i in 1 ..< costs.count {
            dp[i][0] = costs[i][0] + min(dp[i-1][1], dp[i-1][2])
            dp[i][1] = costs[i][1] + min(dp[i-1][0], dp[i-1][2])
            dp[i][2] = costs[i][2] + min(dp[i-1][0], dp[i-1][1])
        }
        return dp.last!.min()!
    }
}

class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var costs = costs
        for i in 1 ..< costs.count {
            costs[i][0] += min(costs[i - 1][1], costs[i - 1][2])
            costs[i][1] += min(costs[i - 1][0], costs[i - 1][2])
            costs[i][2] += min(costs[i - 1][1], costs[i - 1][0])
        }
        let minCost = costs.last!.min()!
        return minCost
    }
}


class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var costs = costs
        var previousHouse = costs[0]
        for index in 1 ..< costs.count {
            costs[index][0] += min(previousHouse[1], previousHouse[2])
            costs[index][1] += min(previousHouse[0], previousHouse[2])
            costs[index][2] += min(previousHouse[0], previousHouse[1])
            previousHouse = costs[index]
        }
        return min(previousHouse[0], previousHouse[1], previousHouse[2])
    }
}
