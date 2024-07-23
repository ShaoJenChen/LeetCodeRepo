//
//  53. Maximum Subarray.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 */
/**
 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        var result = Int.min
        var temp = 0
        for element in nums {
            temp = max(temp + element, element)
            result = max(temp, result)
        }
        return result
        
    }
}

//DP Solution
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums.first!

        for index in 1 ..< nums.count {
            dp[index] = max(nums[index], nums[index] + dp[index - 1])
        }
        return dp.max()!
    }
}
