//
//  3173. Bitwise OR of Adjacent Elements.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/27.
//

import Foundation

class Solution {
    func orArray(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: nums.count - 1)
        for i in 0 ..< nums.count - 1 {
            result[i] = nums[i] | nums[i + 1]
        }
        return result
    }
}
