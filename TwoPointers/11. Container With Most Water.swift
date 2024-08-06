//
//  11. Container With Most Water.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/6.
//

//You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
//
//Find two lines that together with the x-axis form a container, such that the container contains the most water.
//
//Return the maximum amount of water a container can store.
//
//Notice that you may not slant the container.

//Input: height = [1,8,6,2,5,4,8,3,7]
//Output: 49
//Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.


//Constraints:
//
//n == height.length
//2 <= n <= 105
//0 <= height[i] <= 104

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var leftPointer = 0
        var rightPointer = height.count - 1
        var resultArea = Int.min
        while leftPointer < rightPointer {
            let length = rightPointer - leftPointer
            let currentHeight = min(height[leftPointer], height[rightPointer])
            let currentArea = length * currentHeight
            resultArea = max(currentArea, resultArea)
            if height[leftPointer] > height[rightPointer] { rightPointer -= 1 }
            else { leftPointer += 1}
        }
        return resultArea
    }
}



class Solution {
    func maxArea(_ height: [Int]) -> Int {
        
        var result = 0
        
        var startIndexPointer = 0
        
        var endIndexPointer = height.count - 1
        
        while (startIndexPointer < endIndexPointer) {
            
            let w = endIndexPointer - startIndexPointer
            
            let h = min(height[startIndexPointer], height[endIndexPointer])
            
            result = max(result, w * h)
            
            if height[startIndexPointer] > height[endIndexPointer] {
                
                endIndexPointer -= 1
                
            }
            else {
                
                startIndexPointer += 1
                
            }
            
        }
        
        return result
        
    }
}
