//
//  128. Longest Consecutive Sequence.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        //將array 轉 set
        var numberSet = Set<Int>()
        for num in nums {
            numberSet.insert(num)
        }
        var resultLength = 0
        var currentLength = 0
        //輪詢每一個數字
        for number in numberSet {
            var number = number
            //當現在數字沒有 currentNum - 1 的數字，開始往前計算長度
            if !numberSet.contains(number - 1) {
                currentLength = 1
                while numberSet.contains(number + 1) {
                    currentLength += 1
                    number += 1
                }
                resultLength = max(resultLength, currentLength)
            }
        }
        return resultLength
    }
}
