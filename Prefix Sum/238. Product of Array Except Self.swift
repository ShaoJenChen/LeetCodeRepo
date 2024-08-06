//
//  238. Product of Array Except Self.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation

//Prefix Sum, Suffix Sum
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prfixSum = Array(repeating: 0, count: nums.count)
        prfixSum[0] = 1
        for index in 1 ..< nums.count {
            prfixSum[index] = nums[index - 1] * prfixSum[index - 1]
        }
        var suffixSum = Array(repeating: 0, count: nums.count)
        suffixSum[nums.count - 1] = 1

        for index in (0 ..< nums.count - 1).reversed() {
            suffixSum[index] = nums[index + 1] * suffixSum[index + 1]
        }

        var resultArr = Array(repeating: 0, count: nums.count)
        for index in 0 ..< nums.count {
            resultArr[index] = prfixSum[index] * suffixSum[index]
        }

        return resultArr
    }
}


class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        func productSum(_ nums: [Int]) -> Int {
            return nums.reduce(1, { (num1, num2) in
                if num1 == 0 || num2 == 0 { return 0 }
                else { return num1 * num2 }
            })
        }
        var allProduct = productSum(nums)
        var resultProduct = Array(repeating: 0, count: nums.count)

        for index in 0 ..< nums.count {

            if nums[index] != 0, allProduct == 0 {
                resultProduct[index] = 0
            }
            else if nums[index] == 0 {
                var nums = nums
                nums.remove(at: index)
                let newProduct = productSum(nums)
                resultProduct[index] = newProduct == 0 ? 0 : newProduct
            }
            else {
                resultProduct[index] = allProduct / nums[index]
            }
            
        }

        return resultProduct
    }
}
