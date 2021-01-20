//
//  704. Binary Search.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
 */
/**
 Example 1:
 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4

 Example 2:
 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1
 
 Note:
 You may assume that all elements in nums are unique.
 n will be in the range [1, 10000].
 The value of each element in nums will be in the range [-9999, 9999].
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var startIndex = nums.startIndex
    
        var endIndex = nums.endIndex
    
        var targetIndex = (startIndex + endIndex) / 2
    
        if nums[startIndex] == target {
            return startIndex
        }
        
        if nums[endIndex - 1] == target {
            return endIndex - 1
        }
        
        while targetIndex != startIndex && targetIndex != endIndex {
        
            if nums[targetIndex] == target {
            
                return targetIndex
            }
            else if nums[targetIndex] > target {
            
                endIndex = targetIndex
            
                targetIndex = (startIndex + endIndex) / 2
            
            }
            else if nums[targetIndex] < target {
            
                startIndex = targetIndex
            
                targetIndex = (startIndex + endIndex) / 2
            
            }
        
        }

        return -1

    }
}
