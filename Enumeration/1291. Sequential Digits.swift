//
//  1291. Sequential Digits.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/9.
//

//An integer has sequential digits if and only if each digit in the number is one more than the previous digit.
//
//Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.
//
// 
//
//Example 1:
//
//Input: low = 100, high = 300
//Output: [123,234]
//Example 2:
//
//Input: low = 1000, high = 13000
//Output: [1234,2345,3456,4567,5678,6789,12345]
// 
//
//Constraints:
//
//10 <= low <= high <= 10^9

import Foundation

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {

        var allSquentialNumber = [Int]()
        
        for fixDigit in 1 ..< 9 {
            var currentNumber = fixDigit
            while currentNumber < 100_000_000 {
                let nextDigit = (currentNumber % 10) + 1
                if nextDigit < 10 {
                    let nextNumber = currentNumber * 10 + nextDigit
                    allSquentialNumber.append(nextNumber)
                    currentNumber = nextNumber
                }
                else {
                    currentNumber = 100_000_000
                }
            }
        }
        let resultArr = allSquentialNumber.filter({
            $0 >= low && $0 <= high
        }).sorted()

        return resultArr
    }
}
