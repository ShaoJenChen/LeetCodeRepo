//
//  88. Merge Sorted Array.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 */
/**
 Note:
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 */
/**
 Example:

 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var resultArr = [Int]()
        var nums1Pointer = 0
        var nums2Pointer = 0
        while nums1Pointer < m && nums2Pointer < n {
            if nums1[nums1Pointer] < nums2[nums2Pointer] {
                resultArr.append(nums1[nums1Pointer])
                nums1Pointer += 1
            }
            else if nums1[nums1Pointer] > nums2[nums2Pointer] {
                resultArr.append(nums2[nums2Pointer])
                nums2Pointer+=1
            }
            else {
                resultArr.append(nums1[nums1Pointer])
                resultArr.append(nums2[nums2Pointer])
                nums1Pointer += 1
                nums2Pointer+=1
            }
        }
        if nums1Pointer == m {
            for index in nums2Pointer ..< n {
                resultArr.append(nums2[index])
            }
        }
        if nums2Pointer == n {
            for index in nums1Pointer ..< m {
                resultArr.append(nums1[index])
            }
        }
        
        nums1 = resultArr
    }
}
