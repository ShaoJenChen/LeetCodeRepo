//
//  152. Maximum Product Subarray.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/11.
//

//Given an integer array nums, find a
//subarray
// that has the largest product, and return the product.
//
//The test cases are generated so that the answer will fit in a 32-bit integer.
//
// 
//
//Example 1:
//
//Input: nums = [2,3,-2,4]
//Output: 6
//Explanation: [2,3] has the largest product 6.
//Example 2:
//
//Input: nums = [-2,0,-1]
//Output: 0
//Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
// 
//
//Constraints:
//
//1 <= nums.length <= 2 * 104
//-10 <= nums[i] <= 10
//The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var result = nums[0]
        var max_sofar = nums[0]
        var min_sofar = nums[0]
        for i in 1 ..< nums.count {
            let current = nums[i]
            let tempMax = max(current, current * max_sofar, current * min_sofar)
            min_sofar = min(current, current * max_sofar, current * min_sofar)
            max_sofar = tempMax
            result = max(result, max_sofar)
        }
        return result
    }
}
