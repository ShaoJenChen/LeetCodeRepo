//
//  205. Isomorphic Strings.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/7.
//
//Given two strings s and t, determine if they are isomorphic.
//
//Two strings s and t are isomorphic if the characters in s can be replaced to get t.
//
//All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.
//
//
//
//Example 1:
//
//Input: s = "egg", t = "add"
//Output: true
//Example 2:
//
//Input: s = "foo", t = "bar"
//Output: false
//Example 3:
//
//Input: s = "paper", t = "title"
//Output: true
//
//
//Constraints:
//
//1 <= s.length <= 5 * 104
//t.length == s.length
//s and t consist of any valid ascii character.

//第一個String的字元當成Key, 第二個String的字元當成Value
//若第一個String裡面的字元當成key取出的值都對照到第二個String的相同index的字元
//且第二個String的字元要當成Value塞進map時，必須確定map裡面沒有相同的Value

import Foundation

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {

        var isomorphicMap = [String: String]()
        
        for (index, c) in s.enumerated() {
            
            if isomorphicMap[String(c)] == nil {
                
                let newValue = String(t[String.Index(utf16Offset: index, in: t)])
                
                if isomorphicMap.values.contains(newValue) {
                    
                    return false
                }
                
                isomorphicMap[String(c)] = newValue
                
                continue
            }
            
            if let cMappingValue = isomorphicMap[String(c)],
                cMappingValue != String(t[String.Index(utf16Offset: index, in: t)]) {
                    return false
            }
        }
        return true
    }
}
