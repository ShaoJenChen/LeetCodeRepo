//
//  283. Move Zeroes.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/20.
//


//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Example:
//
//Input: [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Note:
//
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.


import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroIndexs = [Int]()
        for (index, num) in nums.enumerated() {
            if num == 0 {
                zeroIndexs.insert(index, at: 0)
            }
        }
        for index in zeroIndexs {
            nums.remove(at: index)
        }
        while zeroIndexs.count > 0 {
            zeroIndexs.popLast()
            nums.append(0)
        }
    }
}
