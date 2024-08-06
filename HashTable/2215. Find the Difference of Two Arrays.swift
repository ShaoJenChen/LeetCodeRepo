//
//  2215. Find the Difference of Two Arrays.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation

class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var set1 = Set(nums1)
        var set2 = Set(nums2)

        var distinctArr1 = [Int]()
        var distinctArr2 = [Int]()
        for num in set1 {
            if !set2.contains(num) {
                distinctArr1.append(num)
            }
        }
        for num in set2 {
            if !set1.contains(num) {
                distinctArr2.append(num)
            }
        }
        return [distinctArr1, distinctArr2]
    }
}
