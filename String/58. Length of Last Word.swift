//
//  58. Length of Last Word.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.

 If the last word does not exist, return 0.

 Note: A word is defined as a maximal substring consisting of non-space characters only.
 */
/**
 Example:

 Input: "Hello World"
 Output: 5
 */
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        
        guard let lastString = s.split(separator: " ").last else { return 0 }
        
        return lastString.count
    }
}
