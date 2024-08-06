//
//  485. Max Consecutive Ones.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var left = 0
        var right = 0
        while right < nums.count {
            if nums[right] == 1 {
                maxCount = max(maxCount, right - left + 1)
            }
            else {
                left = right + 1
                if left == nums.count { break }
            }
            right += 1
        }
        return maxCount
    }
}

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var left = 0
        var right = 0
        var currentCount = 0
        while right < nums.count {
            if nums[right] == 1 {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
            }
            else {
                currentCount = 0
                left = right + 1
                if left == nums.count { break }
            }
            right += 1
        }
        return maxCount
    }
}
