//
//  200. Number of Islands.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/23.
//

//Given an m x n 2d grid map of '1's (land) and '0's (water), return the number of islands.
//
//An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
//
//
//Example 1:
//
//Input: grid = [
//  ["1","1","1","1","0"],
//  ["1","1","0","1","0"],
//  ["1","1","0","0","0"],
//  ["0","0","0","0","0"]
//]
//Output: 1
//Example 2:
//
//Input: grid = [
//  ["1","1","0","0","0"],
//  ["1","1","0","0","0"],
//  ["0","0","1","0","0"],
//  ["0","0","0","1","1"]
//]
//Output: 3
//
//
//Constraints:
//
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 300
//grid[i][j] is '0' or '1'.


import Foundation


class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        guard grid.count != 0 else { return 0 }
        var resultCount = 0
        var tempGrid = grid
        
        func dfs(grid: inout [[Character]], row: Int, column: Int) {
            guard 0 ..< grid.count ~= row, 0 ..< grid[row].count ~= column,
                  grid[row][column] == "1" else { return }
            grid[row][column] = "0"
            dfs(grid: &grid, row: row, column: column + 1)
            dfs(grid: &grid, row: row, column: column - 1)
            dfs(grid: &grid, row: row + 1, column: column)
            dfs(grid: &grid, row: row - 1, column: column)
        }
        
        
        for row in 0 ..< grid.count {
            for column in 0 ..< grid[row].count {
                if tempGrid[row][column] == "1" {
                    resultCount += 1
                    dfs(grid: &tempGrid, row: row, column: column)
                }
            }
        }
        
        return resultCount
    }
}
