//
//  1091. Shortest Path in Binary Matrix.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/30.
//

import Foundation

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        guard grid[0][0] != 1 else { return -1 }
        
        var grid = grid
        var queue = [(row: Int, col: Int, step: Int)]()
        
        let n = grid.count
        let start: (row: Int, col: Int, step: Int) = (0 ,0, 1)
        queue.append(start)
        grid[0][0] = 1

        while !queue.isEmpty {
            let current = queue.removeFirst()
            let i = current.row
            let j = current.col
            let step = current.step
            if i == n - 1 && j == n - 1 { return step } //find bottom-right
            let eight_direction = [(i-1,j-1), (i-1,j), (i-1,j+1), (i,j-1), (i,j+1), (i+1,j-1), (i+1,j), (i+1,j+1)]

            for direction in eight_direction {
                let dir_i = direction.0
                let dir_j = direction.1
                guard dir_i >= 0 && dir_i < n && dir_j >= 0 && dir_j < n else { continue } //in grid range
                if grid[dir_i][dir_j] == 0 {
                    queue.append((dir_i, dir_j, step + 1))
                    grid[dir_i][dir_j] = 1
                }
            }
        }
        return -1
    }
}
