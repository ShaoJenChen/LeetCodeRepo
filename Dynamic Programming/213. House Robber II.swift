//
//  213. House Robber II.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/21.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        // extend from previous House Robber
        // circle Array remove first and remove last

        //edge case
        if nums.count == 2 { return max(nums[0], nums[1]) }
        if nums.count == 1 { return nums[0] }

        func dp(_ n: Int, _ nums: [Int], _ map: inout [Int: Int]) -> Int {
            if n >= nums.count { return 0 }
            if let n_MaxProfit = map[n] { return n_MaxProfit }
            var maxProfit = max(nums[n] + dp(n + 2, nums, &map), dp(n + 1, nums, &map))
            map[n, default: 0] = maxProfit
            return maxProfit
        }

        var map = [Int: Int]()
        var map2 = [Int: Int]()
        var removeFirstNums = Array(nums[nums.startIndex + 1 ..< nums.endIndex])
        var removeLastNums = Array(nums[nums.startIndex ..< nums.endIndex - 1])

        return max(dp(0, removeFirstNums, &map), dp(0, removeLastNums, &map2))
    }
}
