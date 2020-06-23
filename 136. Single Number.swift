//
//  136. Single Number.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

/**
 Example 1:
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 Input: [4,1,2,1,2]
 Output: 4
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {

        var answer = 0
        
        for num in nums {
            
            answer ^= num
            
        }
        
        return answer
    }
}
