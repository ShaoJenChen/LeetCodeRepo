//
//  67. Add Binary.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given two binary strings, return their sum (also a binary string).

 The input strings are both non-empty and contains only characters 1 or 0.
 */
/**
 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 
 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"
 */
/*
 Constraints:

 Each string consists only of '0' or '1' characters.
 1 <= a.length, b.length <= 10^4
 Each string is either "0" or doesn't contain any leading zero.
 */
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var arrayA = [Int]()
        var arrayB = [Int]()
        for (_, element) in a.enumerated() {
            let str = String(element)
            arrayA.append(Int(str)!)
        }
        for (_, element) in b.enumerated() {
            let str = String(element)
            arrayB.append(Int(str)!)
        }
        
        var distance = arrayA.count - arrayB.count
        if distance > 0 {
            while distance > 0 {
                arrayB.insert(0, at: 0)
                distance -= 1
            }
        }
        else {
            while distance < 0 {
                arrayA.insert(0, at: 0)
                distance += 1
            }
        }
        var inverseNumber = [Int]()
        var count = arrayA.count
        var temp = 0
        while count > 0 {
            count -= 1
            let lastNumberA = arrayA.removeLast()
            let lastNumberB = arrayB.removeLast()
            if lastNumberA + lastNumberB + temp == 0 {
                temp = 0
                inverseNumber.append(0)
            }
            else if lastNumberA + lastNumberB + temp == 1 {
                temp = 0
                inverseNumber.append(1)
            }
            else if lastNumberA + lastNumberB + temp == 2 {
                temp = 1
                inverseNumber.append(0)
            }
            else if lastNumberA + lastNumberB + temp == 3 {
                temp = 1
                inverseNumber.append(1)
            }
        }
        if temp == 1 {
            inverseNumber.append(1)
        }
        var result = ""
        while inverseNumber.count > 0 {
            let last = inverseNumber.removeLast()
            result.append(contentsOf: String(last))
        }
        return result
    }
}
