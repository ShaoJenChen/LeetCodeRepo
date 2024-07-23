//
//  560. Subarray Sum Equals K.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/9.
//

//Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
//
//A subarray is a contiguous non-empty sequence of elements within an array.
//
// 
//
//Example 1:
//
//Input: nums = [1,1,1], k = 2
//Output: 2
//Example 2:
//
//Input: nums = [1,2,3], k = 3
//Output: 2
// 
//
//Constraints:
//
//1 <= nums.length <= 2 * 104
//-1000 <= nums[i] <= 1000
//-107 <= k <= 107

import Foundation

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [0: 1]
        var result = 0
        var currSum = 0
        for num in nums {
            currSum += num
            dict[currSum, default: 0] += 1
            result += dict[currSum - k, default: 0]
            
        }
        return result
    }
}


class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        for i in 0 ..< nums.count {
            var sum = 0
            for j in i ..< nums.count {
                sum += nums[j]
                if sum == k {
                     result += 1
                }
            }
        }

        return result
    }
}
