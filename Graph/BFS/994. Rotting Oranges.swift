//
//  994. Rotting Oranges.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/30.
//

import Foundation

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
