//
//  797. All Paths From Source to Target.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/29.
//

import Foundation

//DFS + BackTracking


class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let source = 0
        let destination = graph.count - 1
        var path = [Int]()
        var result = [[Int]]()
        func dfs(current: Int) {
            if current == destination {
                path.append(current)
                result.append(path)
                return
            }
            path.append(current)
            for next in graph[current] {
                dfs(current: next)
                path.removeLast()
            }
        }
        dfs(current: 0)
        return result
    }
}


class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
      var result = [[Int]]()
      var paths = [Int]()
      let source = 0
      let destination = graph.count - 1

      func dfs(node: Int) {
        paths.append(node)
        if node == destination { result.append(paths) }
        for neighbor in graph[node] {
          dfs(node: neighbor)
        }
        paths.removeLast()
      }
      dfs(node: source)
      return result
    }
}
