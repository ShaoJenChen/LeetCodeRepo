//
//  120. Triangle.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/21.
//

import Foundation


class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        //base case triangle[0][0]
        //dp[i][j] = triangle[i][j] + min(dp[i - 1][j - 1], dp[i - 1][j])
        //bottom up
        var dp = Array(repeating: Array(repeating: 0, count: triangle.last!.count), count: triangle.count)
        dp[0][0] = triangle[0][0]
        for i in 1 ..< triangle.count {
            for j in 0 ... i {
                if j - 1 < 0 {
                    dp[i][j] = triangle[i][j] + dp[i - 1][j]
                }
                else if j == i {
                    dp[i][j] = triangle[i][j] + dp[i - 1][j - 1]
                }
                else {
                    dp[i][j] = triangle[i][j] + min(dp[i - 1][j - 1], dp[i - 1][j])
                }
            }
        }
        print(dp)
        return dp.last!.min()!
    }

}

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var map = [String: Int]()

        func dp(_ currentRow: Int, _ currentCol: Int) -> Int {
            if currentRow >= triangle.count { return 0 }

            let currentValue = triangle[currentRow][currentCol]

            if let value = map["\(currentRow)x\(currentCol)"] { return value }

            let minValue = min(currentValue + dp(currentRow+1, currentCol), currentValue + dp(currentRow+1, currentCol+1))

            map["\(currentRow)x\(currentCol)"] = minValue

            return minValue
        }

        return dp(0, 0)
    
    }

}

//如果所有node都是正數應該可以用這個，但這一題有負數，有可能是負很大的數的話就要選那一條路徑，但得一直往下看才知道，所以邏輯會變成要計算現在的值，然後跟下面兩個問上來的值相加取小的
// min(currentValue + dp[currentRow+1][currentCol], currentValue + dp[currentRow+1][currentCol+1])


// var sum = 0

// func dp(_ row: Int, _ col: Int) {
    
//     let currentValue = triangle[row][col]

//     sum += currentValue

//     guard row + 1 < triangle.count else { return }

//     let (nextRow, nextCol) = triangle[row + 1][col] < triangle[row + 1][col + 1] ? (row + 1, col) : (row + 1, col + 1)

//     dp(nextRow, nextCol)
// }
    
// dp(0, 0)

// return sum
