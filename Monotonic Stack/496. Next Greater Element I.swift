//
//  496. Next Greater Element I.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: nums1.count)
        var stack = [Int]()
        var map = [Int: Int]()
        for num in nums2 {
            while !stack.isEmpty {
                let topValue = stack.last!
                if num > topValue {
                    map[topValue] = num
                    stack.popLast()
                }
                else {
                    break
                }
            }
            stack.append(num)
        }

        for index in 0 ..< nums1.count {
            let number = nums1[index]
            if let firstGreater = map[number] {
                result[index] = firstGreater
            }
        }
        return result
    }
}
