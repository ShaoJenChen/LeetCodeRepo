//
//  724. Find Pivot Index.swift
//  1991. Find the Middle Index in Array
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var sum = nums.reduce(0, +)
        var prefixSum = 0
        for (index, num) in nums.enumerated() {
            if sum - num - prefixSum == prefixSum { return index }
            prefixSum += num
        }
        return -1
    }
}
