//
//  66. Plus One.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.
 */
/**
 Example 1:
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 Example 2:
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var result = digits
        var pointer = digits.count - 1
        
        while pointer >= 0 {
            if result[pointer] == 9 {
                result[pointer] = 0
            }
            else {
                result[pointer] = result[pointer] + 1
                return result
            }
            pointer = pointer - 1
        }
        
        result.insert(1,at: 0)
        
        return result
    }
}
