//
//  35. Search Insert Position.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.
 */
/**
 Example 1:
 Input: [1,3,5,6], 5
 Output: 2
 
 Example 2:
 Input: [1,3,5,6], 2
 Output: 1
 
 Example 3:
 Input: [1,3,5,6], 7
 Output: 4
 
 Example 4:
 Input: [1,3,5,6], 0
 Output: 0
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        guard nums.count > 0 else { return 0 }
        
        if target <= nums.first! {
            return 0
        }
        if target > nums.last! {
            return nums.count
        }else if target == nums.last! {
            return nums.count - 1
        }

        var firstPointer = 0
        var lastPointer = nums.count - 1
        var halfPointer: Int = nums.count / 2
        while true {
            if target > nums[halfPointer] {
                firstPointer = halfPointer
            }
            else if target < nums[halfPointer] {
                lastPointer = halfPointer
            }
            else {
                return halfPointer
            }
            halfPointer = (lastPointer - firstPointer) / 2 + firstPointer
            if halfPointer == firstPointer || halfPointer == lastPointer {
                return firstPointer + 1
            }
        }
    }
}
