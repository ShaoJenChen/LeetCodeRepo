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

        //edge case
        if nums.count == 2 { return max(nums[0], nums[1]) }
        if nums.count == 1 { return nums[0] }

        var map = [Int: Int]()
        func dp(_ n: Int) -> Int {

            if n >= nums.count { return 0 }

            if let n_MaxProfit = map[n] { return n_MaxProfit }
            
            var maxProfit = max(nums[n] + dp(n + 2), dp(n + 1))
            map[n, default: 0] = maxProfit
            return maxProfit
        }
        return dp(0)
    }
}
