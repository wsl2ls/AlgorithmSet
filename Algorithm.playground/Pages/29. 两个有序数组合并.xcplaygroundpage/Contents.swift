
/*
 29. 两个有序数组合并
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 num1 成为一个有序数组。
 说明:
 * 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 * 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
  
 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6], n = 3
 输出: [1,2,2,3,5,6]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 双指针法
 时间复杂度O(n+m) 空间复杂度S(1)
 */
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if n == 0 {
        return
    }
    var index1 = 0
    var index2 = 0
    while index2 <  n {
        if nums1[index1] > nums2[index2] {
            nums1.insert(nums2[index2], at: index1)
            nums1.removeLast() //
            index2 += 1
            index1 += 1
        }else {
            if index2 + m == index1 {
                nums1[index1] = nums2[index2]
                index2 += 1
            }
            index1 += 1
        }
    }
}

var nums1 = [1,2,3,0,0,0], m = 3
var nums2 = [2,5,6],   n = 3
merge(&nums1, m, nums2, n)
print(nums1)
