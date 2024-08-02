//
//  494. Target Sum.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/2.
//

import Foundation

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var count = 0
        
        func dfs(index: Int, sum: Int) {
            if index == nums.count {
                if sum == target {
                    count += 1
                }
                return
            }
            dfs(index: index+1, sum: sum - nums[index])
            dfs(index: index+1, sum: sum + nums[index])
        }
        
        dfs(index: 0, sum: 0)
        return count
    }
}
