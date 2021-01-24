//
//  242. Valid Anagram.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/24.
//

//Given two strings s and t , write a function to determine if t is an anagram of s.
//
//Example 1:
//
//Input: s = "anagram", t = "nagaram"
//Output: true
//Example 2:
//
//Input: s = "rat", t = "car"
//Output: false
//Note:
//You may assume the string contains only lowercase alphabets.
//
//Follow up:
//What if the inputs contain unicode characters? How would you adapt your solution to such case?


import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.sorted().hashValue == t.sorted().hashValue
    }
}

