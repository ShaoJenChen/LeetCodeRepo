//
//  1.Two Sum.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (index, number) in nums.enumerated() {
            let needValue = target - number
            if let neededIndex = dict[needValue] {
                var indexs = [index,neededIndex]
                indexs.sort()
                return indexs
            }
            else {
                dict[number] = index
            }
        }
        return []
    }
}
