//
//  643. Maximum Average Subarray I.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation

//439ms Beats 95.35%
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var maxResult = Double(Int.min)
        var left = 0
        var right = k - 1
        var currentSum = 0
        for index in left ... right {
            currentSum += nums[index]
        }
        var currentAverage = Double(currentSum) / Double(k)
        maxResult = max(maxResult, currentAverage)
        
        while right < nums.count {
            currentSum -= nums[left]
            left += 1
            right += 1
            guard right < nums.count else { break }
            currentSum += nums[right]
            currentAverage = Double(currentSum) / Double(k)
            maxResult = max(maxResult, currentAverage)
        }

        return maxResult
    }
}

//2377ms Beats5.65%
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var maxResult = Double(Int.min)
        var left = 0
        var right = k - 1
        while right < nums.count {
            var currentSum = 0
            for index in left ... right {
                currentSum += nums[index]
            }
            let currentAverage = Double(currentSum) / Double(k)
            maxResult = max(maxResult, currentAverage)
            right += 1
            left += 1
        }
        return maxResult
    }
}
