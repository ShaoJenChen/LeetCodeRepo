//
//  344. Reverse String.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/21.
//

//Write a function that reverses a string. The input string is given as an array of characters char[].
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//You may assume all the characters consist of printable ascii characters.
//
//
//
//Example 1:
//
//Input: ["h","e","l","l","o"]
//Output: ["o","l","l","e","h"]
//Example 2:
//
//Input: ["H","a","n","n","a","h"]
//Output: ["h","a","n","n","a","H"]

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        var startIndex = 0
        var lastIndex = s.count - 1
        while(startIndex <= lastIndex) {
            s.swapAt(startIndex, lastIndex)
            startIndex += 1
            lastIndex -= 1
        }
    }
}
