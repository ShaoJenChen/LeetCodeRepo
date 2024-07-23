//
//  125. Valid Palindrome.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/20.
//

//Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
//
//Note: For the purpose of this problem, we define empty string as valid palindrome.
//
//Example 1:
//
//Input: "A man, a plan, a canal: Panama"
//Output: true
//Example 2:
//
//Input: "race a car"
//Output: false
//
//
//Constraints:
//
//s consists only of printable ASCII characters.

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        if s.isEmpty { return true }
        
        var charArray = Array(s.lowercased())
        
        charArray.removeAll { (char) -> Bool in
            if 48 ... 57 ~= char.asciiValue! ||
                97 ... 122 ~= char.asciiValue! {
                return false
            }
            return true
        }
        let reversed = charArray.reversed()
        
        return Array(reversed) == charArray
    }
}

//Two Pointers
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var str = Array(s.lowercased()).map({ char -> String in
          if char.isLetter || char.isNumber {
            return String(char)
          }
          return ""
        })
        str.removeAll(where: { $0 == "" })

        var left = 0
        var right = str.count - 1

        while left <= right {
            if str[left] != str[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
