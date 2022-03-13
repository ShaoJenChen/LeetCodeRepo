//
//  228. Summary Ranges.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/13.
//

//You are given a sorted unique integer array nums.
//
//Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.
//
//Each range [a,b] in the list should be output as:
//
//"a->b" if a != b
//"a" if a == b
//
//
//Example 1:
//Input: nums = [0,1,2,4,5,7]
//Output: ["0->2","4->5","7"]
//Explanation: The ranges are:
//[0,2] --> "0->2"
//[4,5] --> "4->5"
//[7,7] --> "7"
//
//Example 2:
//Input: nums = [0,2,3,4,6,8,9]
//Output: ["0","2->4","6","8->9"]
//Explanation: The ranges are:
//[0,0] --> "0"
//[2,4] --> "2->4"
//[6,6] --> "6"
//[8,9] --> "8->9"
//
//Constraints:
//0 <= nums.length <= 20
//-231 <= nums[i] <= 231 - 1
//All the values of nums are unique.
//nums is sorted in ascending order.

import Foundation

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        
        var result = [String]()
        guard nums.count > 0 else { return result }
        
        if nums.count == 1 {
            return ["\(nums[0])"]
        }
        
        var startIndex = 0
        var endIndex = 0
        
        for index in 1 ..< nums.count {
  
            //當出現不連續的情況時觸發
            if nums[index] != nums[endIndex] + 1 {
                
                if startIndex == endIndex {
                    result.append("\(nums[startIndex])")
                } else {
                    result.append("\(nums[startIndex])->\(nums[endIndex])")
                }
                
                startIndex = index
            }
            
            endIndex = index
            
            //要處理最後一組，因為最後一組沒得觸發
            if index == nums.count - 1 {
                let finalGroup = startIndex == endIndex ? "\(nums[startIndex])" : "\(nums[startIndex])->\(nums[endIndex])"
                result.append(finalGroup)
            }
        }

        return result
    }
}
