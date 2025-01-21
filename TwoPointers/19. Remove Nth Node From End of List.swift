
//need to optimize, this is first try solution
class Solution {
    var head: ListNode?
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let resultNode = head
        func sizeOf(_ node: ListNode?) -> Int {
            var count = 0
            guard let node = node else { return count }
            var countingNode: ListNode? = node
            while countingNode != nil {
                count += 1
                countingNode = countingNode?.next
            }
            return count
        }
        let nodeSize = sizeOf(head)
        guard nodeSize > 2 else {
            if nodeSize == 1 { return nil }
            if nodeSize == 2 && n == 1 {
                head?.next = nil
                return head
            }
            if nodeSize == 2 && n == 2 {
                var pointNode = head?.next
                head?.next = nil
                return pointNode
            }
            return nil
        }

        guard nodeSize != n else {
            var secondNode = head?.next
            head?.next = nil
            return secondNode
        }

        var prepareToHandleCount = nodeSize - n
        //1. prepareToHandleCount node, get next node, and get next for previous node, set this node's next to nil
        //2. prepareToHandleCount node, set next to next.next
        var leftNode: ListNode?
        var rightNode: ListNode?
        var pointNode = head
        while prepareToHandleCount > 1 {
            pointNode = pointNode?.next
            prepareToHandleCount -= 1
        }
        leftNode = pointNode
        rightNode = pointNode?.next?.next
        pointNode?.next?.next = nil
        leftNode?.next = rightNode
        return resultNode
    }
}
