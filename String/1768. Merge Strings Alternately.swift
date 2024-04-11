//
//  1768. Merge Strings Alternately.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/8.
//

//You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.
//
//Return the merged string.
//
// 
//
//Example 1:
//
//Input: word1 = "abc", word2 = "pqr"
//Output: "apbqcr"
//Explanation: The merged string will be merged as so:
//word1:  a   b   c
//word2:    p   q   r
//merged: a p b q c r
//Example 2:
//
//Input: word1 = "ab", word2 = "pqrs"
//Output: "apbqrs"
//Explanation: Notice that as word2 is longer, "rs" is appended to the end.
//word1:  a   b
//word2:    p   q   r   s
//merged: a p b q   r   s
//Example 3:
//
//Input: word1 = "abcd", word2 = "pq"
//Output: "apbqcd"
//Explanation: Notice that as word1 is longer, "cd" is appended to the end.
//word1:  a   b   c   d
//word2:    p   q
//merged: a p b q c   d


import Foundation

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var word1 = word1
        var word2 = word2
        var resultStr = ""
        while !word1.isEmpty || !word2.isEmpty {
            if !word1.isEmpty {
                let c1 = word1.removeFirst()
                resultStr.append(c1)
            }
            if !word2.isEmpty {
                let c2 = word2.removeFirst()
                resultStr.append(c2)
            }
        }
        resultStr.append(contentsOf: word1)
        resultStr.append(contentsOf: word2)
        return resultStr
    }
}
