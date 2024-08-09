//
//  198. House Robber.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/19.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        //dp[i] = max(nums[i] + dp[i - 2], dp[i - 1])
        //base case count == 1, nums[0], count == 2, max(nums[0], nums[1])
        //bottom-up
        var dp = Array(repeating: 0, count: nums.count)
        if nums.count == 1 { return nums[0] }
        if nums.count == 2 { return max(nums[0], nums[1]) }
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2 ..< nums.count {
            dp[i] = max(nums[i] + dp[i - 2], dp[i - 1])
        }
        return dp.max()!
        
    }
}


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
