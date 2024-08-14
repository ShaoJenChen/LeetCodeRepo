//
//  39. Combination Sum.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/14.
//

import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var currentArr = [Int]()
        var currentSum = 0
        var resultArr = [[Int]]()

        func backtracking(_ currentArr: inout [Int], _ currentSum: inout Int) {
            if currentSum > target {
                return
            }
            if currentSum == target {
                resultArr.append(currentArr.sorted())
                return
            }
            for i in 0 ..< candidates.count {
                let currentCandidate = candidates[i]
                currentArr.append(currentCandidate)
                currentSum += currentCandidate
                backtracking(&currentArr, &currentSum)
                currentArr.removeLast()
                currentSum -= currentCandidate
            }
        }
        backtracking(&currentArr, &currentSum)
        let uniqueArr = Set(resultArr)
        return Array(uniqueArr)
    }
}
