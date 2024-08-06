//
//  334. Increasing Triplet Subsequence.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var num_i = Int.max
        var num_j = Int.max
        for currentNum in nums {
            if currentNum <= num_i {
                num_i = currentNum
            }
            else if currentNum <= num_j {
                num_j = currentNum
            }
            else {
                return true
            }
        }
        return false
    }
}
