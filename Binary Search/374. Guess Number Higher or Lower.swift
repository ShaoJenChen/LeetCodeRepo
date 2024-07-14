//
//  374. Guess Number Higher or Lower.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/14.
//

import Foundation

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var lowerNum = 1
        var upperNum = n
        var isGuessed = false
        var middleNum = 0
        while !isGuessed {
            middleNum = (lowerNum + upperNum) / 2
            let returnVal = guess(middleNum)
            if returnVal == -1 { upperNum = middleNum }
            if returnVal == 1 { lowerNum = middleNum }
            if returnVal == 0 { isGuessed = true }

            //adjacent lowerbound and upperbound
            if abs(lowerNum - upperNum) == 1 {
                if guess(lowerNum) == 0 {
                    middleNum = lowerNum
                    break
                }
                if guess(upperNum) == 0 {
                    middleNum = upperNum
                    break
                }
            }
        }
        return middleNum
    }
}
