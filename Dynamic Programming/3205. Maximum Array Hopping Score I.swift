//
//  3205. Maximum Array Hopping Score I.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/21.
//

import Foundation

class Solution {
    func maxScore(_ nums: [Int]) -> Int {
        var scores = Array(repeating: 0, count: nums.count)
        for i in 0 ..< nums.count {
            for j in i+1 ..< nums.count {
                scores[j] = max(scores[j], scores[i] + (j - i) * nums[j])
            }
        }
        return scores.last!
    }
}
