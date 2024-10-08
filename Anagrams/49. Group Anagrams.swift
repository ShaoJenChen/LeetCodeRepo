//
//  49. Group Anagrams.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/24.
//

//Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
//An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//
//
//Example 1:
//
//Input: strs = ["eat","tea","tan","ate","nat","bat"]
//Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
//Example 2:
//
//Input: strs = [""]
//Output: [[""]]
//Example 3:
//
//Input: strs = ["a"]
//Output: [["a"]]
//
//
//Constraints:
//
//1 <= strs.length <= 104
//0 <= strs[i].length <= 100
//strs[i] consists of lower-case English letters.


import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        var strs = Array(strs)
        for i in 0 ..< strs.count {
            let str = strs[i]
            let sortStr = String(str.sorted())
            map[sortStr, default: []].append(str)
        }
        var result = [[String]]()
        for value in map.values {
            result.append(value)
        }
        return result
    }
}
