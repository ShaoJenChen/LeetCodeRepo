//
//  300. Longest Increasing Subsequence.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/7.
//

import Foundation

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        //i > j
        //base case count 1
        //if nums[i] > nums[j]
        //dp[i] = max(dp[i], 1 + dp[j])
        //bottom up
        var dp = Array(repeating: 1, count: nums.count)
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], 1 + dp[j])
                }
            }
        }
        return dp.max()!
    }
}
