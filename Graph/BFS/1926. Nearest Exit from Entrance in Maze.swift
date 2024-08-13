//
//  1926. Nearest Exit from Entrance in Maze.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        //BFS
        //entrance start point
        //each step 4 directions, in grid range
        //exit border empty cell "."
        //need return shortest step
        //visited array [[Bool]]
        //edge case entrance is on the border, return 0
        let rowCount = maze.count
        let colCount = maze[0].count
        var minStepsToExit = 0
        var visited = [[Int]]()
        var queue = [(row: Int, col: Int, steps: Int)]()
        visited.append(entrance)
        queue.append((entrance[0], entrance[1], 0))
        while !queue.isEmpty {
            let cell = queue.removeFirst()
            let currentRow = cell.row
            let currentCol = cell.col
            let currentStep = cell.steps
            //exit
            if (currentRow == 0 || currentRow == rowCount - 1 || currentCol == 0 || currentCol == colCount - 1) {//border
                if currentRow != entrance[0] || currentCol != entrance[1] {//not entrance
                    return currentStep
                }
            }
            //4 directions
            let nextDirections: [(row: Int, col: Int)] =
            [(currentRow, currentCol - 1), (currentRow, currentCol + 1), (currentRow - 1, currentCol), (currentRow + 1, currentCol)]
            for nextDirection in nextDirections {
                let nextRow = nextDirection.row
                let nextCol = nextDirection.col
                guard 0 ..< rowCount ~= nextRow, 0 ..< colCount ~= nextCol else { continue }
                guard maze[nextRow][nextCol] != "+" else { continue }
                guard !visited.contains([nextRow, nextCol]) else { continue }
                visited.append([nextRow, nextCol])
                queue.append((nextRow, nextCol, currentStep + 1))
            }
        }
        return -1
    }
}
