//
//  680. Valid Palindrome II.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/10.
//

//Given a string s, return true if the s can be palindrome after deleting at most one character from it.
//
// 
//
//Example 1:
//
//Input: s = "aba"
//Output: true
//Example 2:
//
//Input: s = "abca"
//Output: true
//Explanation: You could delete the character 'c'.
//Example 3:
//
//Input: s = "abc"
//Output: false
// 
//
//Constraints:
//
//1 <= s.length <= 105
//s consists of lowercase English letters.

import Foundation

class Solution {

    var removalCount = 1

    func validPalindrome(_ s: String) -> Bool {
        var startPointer = s.startIndex
        var endPointer = s.index(before: s.endIndex)
        while startPointer < endPointer {
            if s[startPointer] != s[endPointer] {
                if removalCount == 0 { return false }
                removalCount -= 1
                var newS1 = s
                var newS2 = s
                newS1.remove(at: startPointer)
                newS2.remove(at: endPointer)
                return validPalindrome(newS1) || validPalindrome(newS2)
            }
            startPointer = s.index(startPointer, offsetBy: 1)
            endPointer = s.index(endPointer, offsetBy: -1)
        }
        return true
    }

}


class Solution {

    var removalCount = 1

    func validPalindrome(_ s: String) -> Bool {
        var str = Array(s)
        var left = 0
        var right = str.count - 1
        
        while left < right {

            if str[left] != str[right] {
                if removalCount == 0 { return false }
                removalCount -= 1
                var newS1 = str
                var newS2 = str
                newS1.remove(at: left)
                newS2.remove(at: right)
                return validPalindrome(String(newS1)) || validPalindrome(String(newS2))
            }
            left += 1
            right -= 1
        }
        return true
    }

}
