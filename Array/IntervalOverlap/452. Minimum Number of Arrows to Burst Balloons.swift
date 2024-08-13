//
//  452. Minimum Number of Arrows to Burst Balloons.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation


class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var arrowCount = 1

        //sort
        var sortedBalloons = points.sorted(by: { $0[1] < $1[1] })
        var firstBalloon = sortedBalloons.first!

        for balloon in sortedBalloons {
            if balloon == firstBalloon { continue  }
            if balloon[0] <= firstBalloon[1] { continue }
            else {
                firstBalloon = balloon
                arrowCount += 1
            }
        }
        return arrowCount
    }
}
