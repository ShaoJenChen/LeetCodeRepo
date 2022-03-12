//
//  64. Minimum Path Sum.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/12.
//

//Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
//
//Note: You can only move either down or right at any point in time.
//
//Example 1:
//Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
//Output: 7
//Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
//
//Example 2:
//Input: grid = [[1,2,3],[4,5,6]]
//Output: 12
//
//Constraints:
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 200
//0 <= grid[i][j] <= 100


import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        var map = [String: Int]()
        
        func shortestPath(_ vertical: Int, _ horizontal: Int) -> Int {
            
            if map["\(vertical),\(horizontal)"] != nil {
                return map["\(vertical),\(horizontal)"]!
            }
            
            if vertical == 0, horizontal == 0 {
                return grid[0][0]
            }
            
            if vertical == 0 { return shortestPath(0, horizontal - 1) + grid[0][horizontal] }
            if horizontal == 0 { return shortestPath(vertical - 1, 0) + grid[vertical][0] }
            
            let pathFromTop = shortestPath(vertical - 1, horizontal)
            let pathFromLeft = shortestPath(vertical, horizontal - 1)
            
            let minimumPath = min(pathFromTop, pathFromLeft) + grid[vertical][horizontal]
            
            map["\(vertical),\(horizontal)"] = minimumPath
            
            return minimumPath
            
        }
        
        let horizontal = grid[0].count - 1
        let vertical = grid.count - 1
        
        return shortestPath(vertical, horizontal)
        
    }
}
