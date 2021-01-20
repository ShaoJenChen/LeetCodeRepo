//
//  155. Min Stack.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/20.
//

import Foundation
//Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//
//push(x) -- Push element x onto stack.
//pop() -- Removes the element on top of the stack.
//top() -- Get the top element.
//getMin() -- Retrieve the minimum element in the stack.
//
//
//Example 1:
//
//Input
//["MinStack","push","push","push","getMin","pop","top","getMin"]
//[[],[-2],[0],[-3],[],[],[],[]]
//
//Output
//[null,null,null,null,-3,null,0,-2]
//
//Explanation
//MinStack minStack = new MinStack();
//minStack.push(-2);
//minStack.push(0);
//minStack.push(-3);
//minStack.getMin(); // return -3
//minStack.pop();
//minStack.top();    // return 0
//minStack.getMin(); // return -2
//
//
//Constraints:
//
//Methods pop, top and getMin operations will always be called on non-empty stacks.


class MinStack {

    var array = [Int]()
    
    /** initialize your data structure here. */
    init() {
    }
    
    func push(_ x: Int) {
        self.array.append(x)
    }
    
    func pop() {
        self.array.popLast()
    }
    
    func top() -> Int {
        return self.array.last!
    }
    
    func getMin() -> Int {
        guard let min = self.array.min() else { return 0 }
        return min
    }
}
