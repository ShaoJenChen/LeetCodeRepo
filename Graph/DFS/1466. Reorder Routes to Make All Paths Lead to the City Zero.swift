//
//  1466. Reorder Routes to Make All Paths Lead to the City Zero.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        //create 2d array to memo all city to another (x Memory Limit)
        //create hashmap (v Memory Accepted)
        //if city n can direct route to m, arr[n][m] = 0, arr[m][n] = 1
        //DFS, start from 0 city
        //visited all city
        //append to stack, query from array, + count
        //after visit all city, result count is answer

        var routingMap = [String: Int]()
        var neighborsMap = [Int: [Int]]()
        for connection in connections {
            let cityFrom = connection[0]
            let cityTo = connection[1]
            routingMap["\(cityTo)->\(cityFrom)"] = 1
            neighborsMap[cityFrom, default: []].append(cityTo)
            neighborsMap[cityTo, default: []].append(cityFrom)
        }
        var resultCount = 0
        //DFS
        var stack = [Int]()
        var visited = Array(repeating: false, count: n)
        stack.append(0)
        visited[0] = true
        while !stack.isEmpty {
            let currentCity = stack.popLast()!
            
            let neighbors = neighborsMap[currentCity]!
            for neighbor in neighbors {
                guard visited[neighbor] == false else { continue }
                resultCount += routingMap["\(neighbor)->\(currentCity)", default: 0]
                stack.append(neighbor)
                visited[neighbor] = true
            }
        }

        return resultCount
    }
}
