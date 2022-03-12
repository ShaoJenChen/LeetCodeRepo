//
//  303. Range Sum Query - Immutable.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/12.
//

//Given an integer array nums, handle multiple queries of the following type:
//
//Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
//Implement the NumArray class:
//
//NumArray(int[] nums) Initializes the object with the integer array nums.
//int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
//
//
//Example 1:
//
//Input
//["NumArray", "sumRange", "sumRange", "sumRange"]
//[[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
//Output
//[null, 1, -1, -3]
//
//Explanation
//NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
//numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
//numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
//numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3
//
//
//Constraints:
//
//1 <= nums.length <= 104
//-105 <= nums[i] <= 105
//0 <= left <= right < nums.length
//At most 104 calls will be made to sumRange.

import Foundation

//Brute force O(n)
class NumArray {

    var nums: [Int]
    
    init(_ nums: [Int]) {
        
        self.nums = nums
        
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        
        var result = 0
        
        for index in left ... right {
            
            result += self.nums[index]
            
        }
        
        return result
    }
}

//看完解答後
//感覺這題是想要用這種作法，將所有的sum加總起來放進另一個array
//拿右邊index的總和 減去Prefix 左邊界的sum的數字，就是範圍內的總和
//Prefix Sum
//Caching O(1)

class NumArray {

    var sums = [0]
    
    init(_ nums: [Int]) {
        
        for (index, num) in nums.enumerated() {
            
             sums.append(num + sums[index])
            
        }
        
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        
        return sums[right + 1] - sums[left]
        
    }
}
