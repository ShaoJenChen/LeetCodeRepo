//
//  349. Intersection of Two Arrays.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/22.
//

//Given two arrays, write a function to compute their intersection.
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Note:
//
//Each element in the result must be unique.
//The result can be in any order.


import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set_1 = Set(nums1)
        let set_2 = Set(nums2)
        var result = [Int]()
        for item in set_1 {
            if set_2.contains(item) {
                result.append(item)
            }
        }
        return result
    }
}
