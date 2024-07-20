//
//  345. Reverse Vowels of a String.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {
        var reversedString = s.reversed()
        var reversedVowels = String()
        for c in reversedString {
            if ["a","e","i","o","u","A","E","I","O","U"].contains(c) {
                reversedVowels.append(c)
            }
        }
        var reversedVowelsStr = String()
        for c in s {
            if ["a","e","i","o","u","A","E","I","O","U"].contains(c) {
                reversedVowelsStr.append(reversedVowels.removeFirst())
            }
            else {
                reversedVowelsStr.append(c)
            }
        }
        return reversedVowelsStr
    }
}
