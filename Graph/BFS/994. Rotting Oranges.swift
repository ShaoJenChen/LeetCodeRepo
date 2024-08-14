//
//  994. Rotting Oranges.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/30.
//

import Foundation

// 2024.8.13 do again
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        //edge case
        //empty box, (all zero )return -1
        //not have rotting orange (all fresh) return -1
        //not have fresh orange (all rotting) return 0
        //maybe have orange not adjacent with rotting, return -1
        //BFS
        //Start i and j, not only one, traversal to find out all rotting orange i, j
        //4 direction, and next is fresh orange
        //
        var flatGrid = grid.flatMap({ $0 })
        guard flatGrid.contains(1) && flatGrid.contains(2) else {
            if !flatGrid.contains(1) { return 0 }
            return -1
        }
        var queue = [(row: Int, col: Int, min: Int)]()

        //find out all rotting orange i,j
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count {
                if grid[i][j] == 2 {
                    queue.append((i, j, 0))
                }
            }
        }
        let m = grid.count
        let n = grid[0].count
        var resultMin = 0
        var grid = grid
        //BFS
        while !queue.isEmpty {
            let currentOrange = queue.removeFirst()
            let currentRow = currentOrange.row
            let currentCol = currentOrange.col
            let currentMin = currentOrange.min
            resultMin = max(resultMin, currentMin)
            let directions: [(row: Int, col: Int)] =
            [(currentRow, currentCol - 1), (currentRow, currentCol + 1), (currentRow - 1, currentCol), (currentRow + 1, currentCol)]

            for direction in directions {
                let nextRow = direction.row
                let nextCol = direction.col
                guard 0 ..< m ~= nextRow, 0 ..< n ~= nextCol else { continue }
                guard grid[nextRow][nextCol] == 1 else { continue }
                queue.append((nextRow, nextCol, currentMin + 1))
                grid[nextRow][nextCol] = 2
            }
        }
        if grid.flatMap({$0}).contains(1) { return -1 }
        return resultMin
    }
}



class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        //only fresh orange in grid also return -1
        //-> not contain rotten (2)
        //only rotten orange in grid return 0
        //-> not contain fresh (1)
        //only empty grid  return 0
        //-> not contain any orange
        if !grid.flatMap({ $0 }).contains(2) && !grid.flatMap({ $0 }).contains(1) { return 0 }
        
        let isOnlyFreshOrange = !grid.flatMap({ $0 }).contains(2)
        if isOnlyFreshOrange { return -1 }
        
        let isOnlyRottenOrange = !grid.flatMap({ $0 }).contains(1)
        if isOnlyRottenOrange { return 0 }
        
        var result_minute = 0
        let m = grid.count
        let n = grid[0].count
        var queue = [(row: Int, col: Int, min: Int)]()
        // it's not only one rotten orange at start up
        // the rotten orange is not must at positon (0, 0)
        var rottenOrange = (row: 0, col: 0, min: 0)
        for row in 0 ..< grid.count {
            for col in 0 ..< grid[row].count {
                if grid[row][col] == 2 {
                    rottenOrange.row = row
                    rottenOrange.col = col
                    queue.append(rottenOrange)
                }
            }
        }
        while !queue.isEmpty {
            let orange = queue.removeFirst()
            let row = orange.row
            let col = orange.col
            let min = orange.min
            let four_directions: [(row: Int, col: Int)] = [(row, col-1), (row, col+1), (row-1, col), (row+1, col)]
            result_minute = max(result_minute, min)
            
            for direction in four_directions {
                let newRow = direction.row
                let newCol = direction.col
                guard newRow >= 0 && newRow < m && newCol >= 0 && newCol < n else { continue }
                if grid[newRow][newCol] == 1 {
                    queue.append((newRow, newCol, min + 1))
                    grid[newRow][newCol] = 2
                }
            }
        }
        if grid.flatMap({ $0 }).contains(1) { return -1 }
        return result_minute
    }
}
