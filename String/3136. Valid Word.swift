//
//  3136. Valid Word.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/19.
//

import Foundation

class Solution {
    func isValid(_ word: String) -> Bool {
        guard word.count >= 3 else { return false }
        var word = Array(word)
        var vowelCount = 0
        var consonantCount = 0
        var vowels = Set(["a","e","i","o","u","A","E","I","O","U"])
        for i in 0 ..< word.count {
            let ch = word[i]
            guard ch.isLetter || ch.isNumber else { return false }
            if vowels.contains(String(ch)) {
                vowelCount += 1
            }
            if !ch.isNumber && !vowels.contains(String(ch)) {
                consonantCount += 1
            }
        }
        return vowelCount >= 1 && consonantCount >= 1
    }
}
