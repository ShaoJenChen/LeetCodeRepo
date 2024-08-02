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

//BFS
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var islandsCount = 0
        let m = grid.count
        let n = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        for i in 0 ..< m {
            for j in 0 ..< n {
                if grid[i][j] == "1" {
                    islandsCount += 1
                    //BFS
                    var queue = [(i: Int, j: Int)]()
                    queue.append((i, j))
                    visited[i][j] = true
                    while !queue.isEmpty {
                        let element = queue.removeFirst()
                        let current_i = element.i
                        let current_j = element.j
                        grid[current_i][current_j] = "0"
                        
                        let four_direction: [(i: Int, j: Int)] = [(current_i - 1, current_j),
                                                                  (current_i + 1, current_j),
                                                                  (current_i, current_j - 1),
                                                                  (current_i, current_j + 1)]
                        for direction in four_direction {
                            guard 0 ..< m ~= direction.i, 0 ..< n ~= direction.j else { continue }
                            guard grid[direction.i][direction.j] == "1" else { continue }
                            guard visited[direction.i][direction.j] == false else { continue }
                            queue.append((direction.i, direction.j))
                            visited[direction.i][direction.j] = true
                        }
                    }
                }
            }
        }
        return islandsCount
    }
}


//DFS
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
