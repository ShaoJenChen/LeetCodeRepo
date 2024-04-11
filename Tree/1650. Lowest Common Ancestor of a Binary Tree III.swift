//
//  1650. Lowest Common Ancestor of a Binary Tree III.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/10.
//

//Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).
//
//Each node will have a reference to its parent node. The definition for Node is below:
//
//class Node {
//    public int val;
//    public Node left;
//    public Node right;
//    public Node parent;
//}
//According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes p and q in a tree T is the lowest node that has both p and q as descendants (where we allow a node to be a descendant of itself)."



import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public var parent: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.parent = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var p = p
        var q = q
        var pNodeStack = [Node]()
        var qNodeStack = [Node]()
        while p!.parent != nil {
            pNodeStack.append(p!)
            p = p!.parent
        }
        pNodeStack.append(p!)
        while q!.parent != nil {
            qNodeStack.append(q!)
            q = q!.parent
        }
        qNodeStack.append(q!)

        var candidateNode: Node?

        while !pNodeStack.isEmpty && !qNodeStack.isEmpty {
            let PLastNode = pNodeStack.popLast()

            let QLastNode = qNodeStack.popLast()
            
            if PLastNode === QLastNode {
                candidateNode = PLastNode
            }
        }
        return candidateNode
    }
}
