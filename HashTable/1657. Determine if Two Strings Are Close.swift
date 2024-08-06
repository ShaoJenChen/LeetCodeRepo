//
//  1657. Determine if Two Strings Are Close.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/6.
//

import Foundation

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        
        //1. same length
        guard word1.count == word2.count else { return false }
        
        //2. all char exist same and with same counts
        var word1 = word1
        var word2 = word2
        var map1 = [String: Int]()
        var map2 = [String: Int]()
        for char in word1 {
            map1[String(char), default: 0] += 1
        }
        for char in word2 {
            map2[String(char), default: 0] += 1
        }

        guard map1.keys.sorted() == map2.keys.sorted(),
        map1.values.sorted() == map2.values.sorted() else { return false }

        return true
    }
}
