//
//  350. Intersection of Two Arrays II.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/22.
//

//Given two arrays, write a function to compute their intersection.
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2,2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [4,9]
//Note:
//
//Each element in the result should appear as many times as it shows in both arrays.
//The result can be in any order.
//Follow up:
//
//What if the given array is already sorted? How would you optimize your algorithm?
//What if nums1's size is small compared to nums2's size? Which algorithm is better?
//What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

import Foundation


class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var result = [Int]()
        for keyNum in nums1 {
            if let keyNumValue = map[keyNum] {
                map[keyNum] = keyNumValue + 1
            }
            else {
                map[keyNum] = 1
            }
        }
        for keyNum in nums2 {
            if let keyNumValue = map[keyNum], keyNumValue > 0 {
                map[keyNum] = keyNumValue - 1
                result.append(keyNum)
            }
        }
        return result
    }
}
