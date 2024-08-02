//
//  404. Sum of Left Leaves.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/31.
//

import Foundation


class Solution {

    var sum = 0

    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        
        func helper(_ root: TreeNode?) {
            guard let root else { return }
        
            // as a root, check left child whether is leaf, or recursive left child
            // and right child
            // if left child is leaf sum += left child,
            // directly recursive right child
            
            if let leftChiid = root.left, leftChiid.left == nil, leftChiid.right == nil { //left child is leaf
                sum += leftChiid.val
                helper(root.right)
            }
            else {
                helper(root.left)
                helper(root.right)
            }
        }
        helper(root)
        return sum
    }
}
