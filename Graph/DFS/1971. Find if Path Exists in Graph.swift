//
//  1971. Find if Path Exists in Graph.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/29.
//

import Foundation


class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        //1. memo edges from all node to all other node
        var map = [Int:[Int]]()
        for edge in edges {
            map[edge[0], default: []].append(edge[1])
            map[edge[1], default: []].append(edge[0])
        }
        //2. create visited array to note whiche node has visited
        var visited = Array(repeating: false, count: n)
        visited[source] = true

        //3. start from source and create stack to traversal all node
        var stack = [Int]()
        stack.append(source)

        while !stack.isEmpty {
            var currentNode = stack.removeLast()
            if currentNode == destination { return true }
            let neibors = map[currentNode]!
            for neibor in neibors {
                if visited[neibor] == false {
                    stack.append(neibor)
                    visited[neibor] = true
                }
            }
        }

        return false
    }
}


class Solution {
  func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
    var visited = Array(repeating: false, count: n)
    var stack = [Int]()
    stack.append(source)
    
    var edgeMap = [Int: [Int]]()
    for edge in edges {
      edgeMap[edge[0], default: []].append(edge[1])
      edgeMap[edge[1], default: []].append(edge[0])
    }

    while !stack.isEmpty {
      let current = stack.popLast()!
      if current == destination { return true }

      guard visited[current] == false else { continue }
      
      let neighbors = edgeMap[current]!
      stack.append(contentsOf: neighbors)

      visited[current] = true
    }
    return false
  }
}
