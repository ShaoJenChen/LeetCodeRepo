//
//  119. Pascal's Triangle II.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

 Note that the row index starts from 0.
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 */

/**
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 */

/**
 Example:
 Input: 3
 Output: [1,3,3,1]
 */

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1]}
        if rowIndex == 1 { return [1,1] }
        let previousRow = getRow(rowIndex - 1)
        
        var nowRowArr = [Int]()
        nowRowArr.append(1)
        for column in 1 ..< rowIndex {
            let previousRowsSum = previousRow[column] + previousRow[column - 1]
            nowRowArr.append(previousRowsSum)
        }
        nowRowArr.append(1)
        return nowRowArr
    }
}
