//
//  661. Image Smoother.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/8.
//

//An image smoother is a filter of the size 3 x 3 that can be applied to each cell of an image by rounding down the average of the cell and the eight surrounding cells (i.e., the average of the nine cells in the blue smoother). If one or more of the surrounding cells of a cell is not present, we do not consider it in the average (i.e., the average of the four cells in the red smoother).

import Foundation

class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {

        let m = img.count
        let n = img[0].count

        var resultMatrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

        for i in 0 ..< m {
            for j in 0 ..< n {
                var sum = 0
                var count = 0

                for row_i in max(i - 1, 0) ... min(i + 1, m - 1) {
                    for column_j in max(j - 1, 0) ... min(j + 1, n - 1){
                        sum += img[row_i][column_j]
                        count += 1
                    }
                }
                resultMatrix[i][j] = sum / count
            }
        }
        return resultMatrix
    }
}
