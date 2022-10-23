//
//  572. Subtree of Another Tree
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2022/10/23.
//

//Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.
//
//A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.
//Example 1:
//
//Input:
//    Tree 1                     Tree 2
//          1                         3
//         / \                       / 
//        3   2                     5  
//       /                             
//      5                            
//Output:
//    true


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        
        let mod1 = 1000000000
        let mod2 = 2100000000
        var hashTuples = [(Int, Int)]()
        
        func hash(_ treeNode: TreeNode?, _ isNeedSave: Bool = false) -> (Int, Int) {
           
            guard let node = treeNode else { return (2, 8) }
            
            let leftHashTuple = hash(node.left, true)
            let rightHashTuple = hash(node.right, true)
            
            
            let tupleFirstValue = (leftHashTuple.0 << 5 + rightHashTuple.0 << 2 + node.val) % mod1
            let tupleSecondValue = (rightHashTuple.1 << 2 + rightHashTuple.1 << 4 + node.val) % mod2
            
            if isNeedSave { hashTuples.append((tupleFirstValue, tupleSecondValue)) }
            
            return (tupleFirstValue, tupleSecondValue)
            
        }
        
        
        hash(root, true)
        
        let subRootHashTuple = hash(subRoot)
        
        return hashTuples.contains(where: { $0 == subRootHashTuple.0 && $1 == subRootHashTuple.1 })
        
    }
}
