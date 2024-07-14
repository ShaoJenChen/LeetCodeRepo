//
//  450. Delete Node in a BST.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation


class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        // case 1: root is nil
        guard let root = root else { return nil }
        
        if root.val == key {
            // case 2: root is a leaf node
            if root.left == nil && root.right == nil {
                return nil
            }
            
            // case 3: root has only right child
            if root.left == nil && root.right != nil {
                return root.right
            }
            
             // case 4: root has only left child
            if root.left != nil && root.right == nil {
                return root.left
            }
            
            // case 5: root has both left and right child, we put the left child to the left leaf of right child
            var cur: TreeNode? = root.right   // to find the left leaf of right child
            while cur?.left != nil {
                cur = cur?.left
            }
            
            cur?.left = root.left   // put the left child to the left leaf of right child
            return root.right
        }
        
        if root.val > key {
            root.left = deleteNode(root.left, key)
        }
        
        if root.val < key {
            root.right = deleteNode(root.right, key)
        }
        
        return root
    }
}
