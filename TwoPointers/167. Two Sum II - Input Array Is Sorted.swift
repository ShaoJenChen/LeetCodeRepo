//
//  167. Two Sum II - Input Array Is Sorted.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/10.
//

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            if numbers[left] + numbers[right] == target {
                return [left + 1, right + 1]
            }
            if numbers[left] + numbers[right] > target {
                right -= 1
            } else {
                left += 1
            }
        }
        return []
    }
}
