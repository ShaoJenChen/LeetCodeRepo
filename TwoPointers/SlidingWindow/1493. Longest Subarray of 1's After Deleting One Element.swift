//
//  1493. Longest Subarray of 1's After Deleting One Element.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation


class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var longest = 0
        var currentDeleteCount = 0

        while right < nums.count {
            if nums[right] == 0 {
                currentDeleteCount += 1
            }
            while currentDeleteCount > 1 {
                if nums[left] == 0 {
                    currentDeleteCount -= 1
                }
                left += 1
            }
            longest = max(longest, right - left)
            right += 1
        }
        
        return longest
    }
}

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var longest = 0
        var mustDeleteCount = 1
        var currentDeleteCount = 0
        var isMetZero = false
        while right < nums.count {
            if nums[right] == 0 {
                currentDeleteCount += 1
                isMetZero = true
            }
            while currentDeleteCount > mustDeleteCount {
                if nums[left] == 0 {
                    currentDeleteCount -= 1
                }
                left += 1
            }
            longest = currentDeleteCount > 0 ? max(longest, right - left + 1 - currentDeleteCount) : max(longest, right - left + 1)

            right += 1
        }
        if !isMetZero { longest -= mustDeleteCount }
        return longest
    }
}
