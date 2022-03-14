//
//  219. Contains Duplicate II.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/14.
//

//Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
//
//
//
//Example 1:
//
//Input: nums = [1,2,3,1], k = 3
//Output: true
//Example 2:
//
//Input: nums = [1,0,1,1], k = 1
//Output: true
//Example 3:
//
//Input: nums = [1,2,3,1,2,3], k = 2
//Output: false
//
//
//Constraints:
//
//1 <= nums.length <= 105
//-109 <= nums[i] <= 109
//0 <= k <= 105

import Foundation

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        var numsMap = [Int: [Int]]()
        
        for index in 0 ..< nums.count {
            
            if var indexArr = numsMap[nums[index]] {
                indexArr.append(index)
                numsMap[nums[index]] = indexArr
            }
            else {
                numsMap[nums[index]] = [index]
            }
            
        }

        for key in numsMap.keys {
            guard let arr = numsMap[key] else { continue }
            guard arr.count >= 2 else { continue }
            
            for i in 0 ..< arr.count {
                let j = i + 1
                if j == arr.count { break }
                
                if (arr[j] - arr[i]) <= k {
                    return true
                }
            }
        }
        
        return false
    }
}
