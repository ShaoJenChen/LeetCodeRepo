//
//  118. Pascal's Triangle.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 */

/**
 Example:
 
 Input: 5
 Output:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        if numRows <= 0 { return []}
        
       var result = [[Int]]()
    
    for index in 1...numRows {
        result.append(Array(repeatElement(1, count: index)))
    }
    
    if numRows > 2 {
        let row = 2
        for rowIndex in row ..< numRows {
            for columnIndex in 1 ..< rowIndex {
                result[rowIndex][columnIndex] = result[rowIndex-1][columnIndex-1] + result[rowIndex-1][columnIndex]
            }
        }
    }
    
    return result
        
    }

}

//dp
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1],[1, 1]]
        if numRows == 1 { return Array(arrayLiteral: result[0]) }
        if numRows == 2 { return result }
        for i in 2 ..< numRows  {
            var currentRow = Array(repeating: 1, count: i + 1)
            for j in 1 ..< i {
                currentRow[j] = result[i - 1][j - 1] + result[i - 1][j]
            }
            result.append(currentRow)
        }
        return result
    }
}
