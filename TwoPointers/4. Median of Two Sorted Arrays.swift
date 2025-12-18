class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        //two pointer
        var i = 0
        var j = 0
        let m = nums1.count
        let n = nums2.count
        var mergedArray: [Double] = []
        //edge case
        if m == 0 {
            mergedArray = nums2.map({ Double($0) })
            j = n
        }
        if n == 0 {
            mergedArray = nums1.map({ Double($0) })
            i = m
        }
        
        while i < m && j < n {
            if nums1[i] <= nums2[j] {
                mergedArray.append(Double(nums1[i]))
                i += 1
            }
            else if nums1[i] > nums2[j] {
                mergedArray.append(Double(nums2[j]))
                j += 1
            }
        }
        //nums1 else item...
        if i < m {
            while i < m {
                mergedArray.append(Double(nums1[i]))
                i += 1
            }
        }
        //nums2 else item...
        if j < n {
            while j < n {
                mergedArray.append(Double(nums2[j]))
                j += 1
            }
        }
        
        //caculate answer
        let isEven = mergedArray.count % 2 == 0

        if isEven {
            let index1 = mergedArray.count / 2 - 1
            let index2 = mergedArray.count / 2
            let average: Double = (mergedArray[index1] + mergedArray[index2]) / 2
            return average
        }
        else {
            let index: Int = mergedArray.count / 2
            return mergedArray[index]
        }
        return -1
    }
}
