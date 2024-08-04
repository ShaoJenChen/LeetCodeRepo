//
//  733. Flood Fill.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/3.
//

import Foundation

//DFSf
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        let m = image.count
        let n = image[0].count
        var grid = image
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var stack = [(i: Int, j: Int)]()
        let wantedColor = grid[sr][sc]
        stack.append((sr, sc))
        
        while !stack.isEmpty {
            let cell = stack.removeFirst()
            let row = cell.i
            let col = cell.j
            grid[row][col] = color
            
            let fourDirections: [(row: Int, col: Int)] = [(row, col - 1), (row, col + 1), (row - 1, col), (row + 1, col)]
            for direction in fourDirections {
                guard 0 ..< m ~= direction.row, 0 ..< n ~= direction.col else { continue }
                guard grid[direction.row][direction.col] == wantedColor else { continue }
                guard visited[direction.row][direction.col] == false else { continue }
                stack.append((direction.row, direction.col))
                visited[direction.row][direction.col] = true
            }
        }
        
        return grid
        
    }
}
