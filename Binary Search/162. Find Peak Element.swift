//
//  162. Find Peak Element.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

class Solution {

    //O(n)
    func findPeakElement(_ nums: [Int]) -> Int {
        
        for index in 0 ..< nums.count - 1{
            if nums[index] > nums[index + 1] {
                return index
            }
        }
        return nums.count - 1
    }
    
    //O(log n)
    func findPeakElement(_ nums: [Int]) -> Int {

        var (l,r) = (0, nums.count-1)
        while l < r {
            let mid = (l+r)/2
            (l,r) = nums[mid] > nums[mid+1] ? (l,mid) : (mid+1,r)
        }
        return l
    }
    
}
