//
//  14. Longest Common Prefix.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 */
/**
 Example 1:
 Input: ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: ["dog","racecar","car"]
 Output: ""
 
 Explanation: There is no common prefix among the input strings.
 
 Note:
 All given inputs are in lowercase letters a-z.
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        guard strs.count > 0 else { return "" }
        
        var isGetLongestIndex = false
        var result = ""
        var compareIndex = 1
        var shortestStrCount = Int.max
        
        for (_,str) in strs.enumerated() {
            if str.count < shortestStrCount {
                shortestStrCount = str.count
            }
        }
        
        if shortestStrCount == 0 {
           return result
        }
        
        while (!isGetLongestIndex && compareIndex <= shortestStrCount ) {
            
            result = ""
            result += strs[0].prefix(compareIndex)
            
            for (_, str) in strs.enumerated() {
                if str.hasPrefix(result) {
                    continue
                }
                else {
                    isGetLongestIndex = true
                    break
                }
            }
            
            if !isGetLongestIndex {
                compareIndex += 1
            }
            else {
                compareIndex -= 1
            }
            
            if !isGetLongestIndex && compareIndex > shortestStrCount {
                return result
            }
            
        }
        
        result = ""
        if compareIndex != 0 {
            result += strs[0].prefix(compareIndex)
        }
        
        return result
    }
}



class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        func lcp(_ aStr: String, _ bStr: String) -> String {
            return aStr.commonPrefix(with: bStr)
        }
        var commonPrefix = strs[0] 
        for i in 1 ..< strs.count {
            commonPrefix = lcp(commonPrefix, strs[i])
        }
        return commonPrefix
    }
}
