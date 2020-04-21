/*
 33. 数组中的第K个最大元素
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 
 示例 1:
 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 
 示例 2:
 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 
 说明:
 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-largest-element-in-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 小顶推
 时间复杂度O(NlogK) 空间复杂度S(K)
 */
func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
    // 取前k个作为小顶堆，堆容量为k
    var heap = [Int](nums[0..<k])
    // 自下而上，下滤建堆
    var index = max(0, heap.count >> 1 - 1)
    while index >= 0 {
        siftDown(&heap, index: index)
        index -= 1
    }
    // 遍历剩下的数据
    for index in k..<nums.count {
        let num = nums[index]
        // 如果发现一个值比堆中最小的大，换掉堆中最小的
        if num > heap[0] {
            heap[0] = num
            siftDown(&heap, index: 0)
        }
    }
    // 堆顶元素就是第k小元素
    return heap[0]
}
/// 下滤，适用小顶堆
func siftDown(_ nums: inout [Int], index: Int) {
    var index = index
    // 备份待下滤元素
    let element = nums[index]
    let half = nums.count >> 1
    // index要指向非叶子节点，不断下移
    while index < half {
        // 取出左节点
        var childIndex = index << 1 + 1
        var childValue = nums[childIndex]
        // 如果右节点值比左小，指向右节点
        if childIndex + 1 < nums.count && nums[childIndex + 1] < childValue {
            childIndex += 1
            childValue = nums[childIndex]
        }
        guard element > childValue else {
            break
        }
        // 子节点移到父节点处
        nums[index] = childValue
        index = childIndex
        
    }
    nums[index] = element
}

/*
 快排思想
 时间复杂度O(N) 空间复杂度S(1)
 */
func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
    return findKth(nums, k, low: 0, high: nums.count - 1)
}

func findKth(_ nums: [Int], _ k: Int, low: Int, high: Int) -> Int {
    var copy = [Int].init(nums)
    let mid = partion(&copy, low: low, high: high)
    if mid == k - 1 {
        return copy[mid]
    } else if mid < k - 1 {
        return findKth(copy, k, low: mid + 1, high: high)
    } else {
        return findKth(copy, k, low: low, high: mid - 1)
    }
}
func partion(_ nums: inout [Int], low: Int, high: Int) -> Int {
    guard low <= high, high < nums.count else {
        return -1
    }
    let tmp = nums[low]
    var startIdx = low
    var endIdx = high
    while startIdx < endIdx {
        while startIdx < endIdx, nums[endIdx] <= tmp {
            endIdx = endIdx - 1
        }
        nums[startIdx] = nums[endIdx]
        
        while startIdx < endIdx, nums[startIdx] >= tmp {
            startIdx = startIdx + 1
        }
        nums[endIdx] = nums[startIdx]
    }
    nums[startIdx] = tmp
    return startIdx
}


var nums = [3,2,1,5,6,4]
var k = 2
print(findKthLargest1(nums, 2))
