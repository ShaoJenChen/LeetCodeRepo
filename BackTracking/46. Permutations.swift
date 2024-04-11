//
//  46. Permutations.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/10.
//

//Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
//
// 
//
//Example 1:
//
//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//Example 2:
//
//Input: nums = [0,1]
//Output: [[0,1],[1,0]]
//Example 3:
//
//Input: nums = [1]
//Output: [[1]]
// 
//
//Constraints:
//
//1 <= nums.length <= 6
//-10 <= nums[i] <= 10
//All the integers of nums are unique.

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tmp = [Int]()
        func backTrack(_ nums: [Int], _ tmp: inout [Int]) {
            if tmp.count == nums.count {
                result.append(tmp)
            }
            for num in nums {
                if tmp.contains(num) {
                    continue
                }
                tmp.append(num)
                backTrack(nums, &tmp)
                tmp.removeLast()
            }
        }
        backTrack(nums, &tmp)
        return result
    }
}
