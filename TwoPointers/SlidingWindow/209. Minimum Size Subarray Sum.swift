//
//  209. Minimum Size Subarray Sum.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/15.
//

import Foundation

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var sum = 0
        var resultLength = nums.count + 1
        while right < nums.count {
            let currentNum = nums[right]
            sum += currentNum
            while sum >= target {
                resultLength = min(resultLength, right - left + 1)
                let leftNum = nums[left]
                sum -= leftNum
                left += 1
            }
            right += 1
        }
        return resultLength == nums.count + 1 ? 0 : resultLength
    }
}
