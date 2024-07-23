//
//  198. House Robber.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/19.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        //n = max (n + dp(n+2), dp(n+1))
        var map = [String: Int]()
        func dp(_ index: Int) -> Int {
            guard index < nums.count else { return 0 }
            if let profit = map["\(index)"] { return profit }
            var maxProfit = max(nums[index] + dp(index + 2), dp(index + 1))
            map["\(index)", default: 0] = maxProfit
            return maxProfit
        }
        return dp(0)
    }
}
