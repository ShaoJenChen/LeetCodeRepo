//
//  409. Longest Palindrome.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/6.
//

//Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
//
//Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
//
//
//
//Example 1:
//
//Input: s = "abccccdd"
//Output: 7
//Explanation:
//One longest palindrome that can be built is "dccaccd", whose length is 7.
//Example 2:
//
//Input: s = "a"
//Output: 1
//Example 3:
//
//Input: s = "bb"
//Output: 2



import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        
        var palindRomeDict = [String: Int]()
        
        for letter in s {
            
            guard let letterCount = palindRomeDict[String(letter)] else {
                
                palindRomeDict[String(letter)] = 1
                
                continue
            }
            
            palindRomeDict[String(letter)] = letterCount + 1
            
        }
        
        var result = 0
        
        var isHaveOdd = false
        
        for palindRomeCount in palindRomeDict.values {
            
            if palindRomeCount % 2 == 0 {
                
                result += palindRomeCount
                
            }
            
            else {
                
                result += palindRomeCount - 1
                
                isHaveOdd = true
                
            }
            
        }
        
        if isHaveOdd {
            
            result += 1
            
        }
        
        return result
        
    }
    
}
