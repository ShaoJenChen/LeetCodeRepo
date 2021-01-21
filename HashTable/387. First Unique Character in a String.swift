//
//  387. First Unique Character in a String.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/21.
//

//Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode"
//return 2.
//
//
//Note: You may assume the string contains only lowercase English letters.

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var map = [String: Int]()
        let resultIndex = -1
        for char in s {
            if map["\(char)"] == nil {
                map["\(char)"] = 1
            }
            else {
                map["\(char)"] = map["\(char)"]! + 1
            }
        }
        for (index, char) in s.enumerated() {
            if map["\(char)"] == 1 {
                return index
            }
        }
        return resultIndex
    }
}
