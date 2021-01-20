//
//  169. Majority Element.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.
 */
/**
 Example 1:
 Input: [3,2,3]
 Output: 3
 
 Example 2:
 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {

        var dict = [Int: Int]()
        
        for element in nums {
            
            guard let elementCount = dict[element] else {
                
                dict[element] = 1
                
                continue
            }
            
            dict[element] = elementCount + 1
        }
        
        var count = 0
        var answer = 0
        
        for dic in dict {
            if dic.value > count {
                count = dic.value
                answer = dic.key
            }
        }
        
        return answer
    }
}
