//
//  28. Implement strStr().swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 */
/**
 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 */
/**
 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 */


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        var haystack = Array(haystack)
        var needle = Array(needle)

        func isOccurrence(_ startIndex: Int) -> Bool {
            var pointer1 = startIndex
            var pointer2 = 0
            while pointer2 < needle.count, pointer1 < haystack.count,
                haystack[pointer1] == needle[pointer2] {
                pointer1 += 1
                pointer2 += 1
            }
            return pointer2 == needle.count
        }

        for index in 0 ..< haystack.count {
            let currentChar = haystack[index]
            if currentChar == needle[0] {
                if isOccurrence(index) {
                    return index
                }
            }
        }
        return -1
    }
}


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        guard needle.count > 0 else { return 0 }

        guard haystack.count >= needle.count else { return -1 }
        
        if haystack == needle { return 0 }
        
        for i in 0 ... haystack.count - needle.count {
            let startindex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + needle.count - 1)
            
            if haystack[startindex ... endIndex] == needle {
                return i
            }
        }
        
        return -1
    }
}
