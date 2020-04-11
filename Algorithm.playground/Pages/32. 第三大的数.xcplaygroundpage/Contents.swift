/*
 32. 第三大的数
 给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。

 示例 1:
 输入: [3, 2, 1]
 输出: 1
 解释: 第三大的数是 1.
 
 示例 2:
 输入: [1, 2]
 输出: 2
 解释: 第三大的数不存在, 所以返回最大的数 2 .
 
 示例 3:
 输入: [2, 2, 3, 1]
 输出: 1
 解释: 注意，要求返回第三大的数，是指第三大且唯一出现的数。
 存在两个值为2的数，它们都排第二。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/third-maximum-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 三指针
 时间复杂度O(n) 空间复杂度(1)
 */
func thirdMax(_ nums: [Int]) -> Int {
   
    var first = Int.min
    var second = Int.min
    var three = Int.min
    
    for i in (0..<nums.count) {
        
        if nums[i] <= three {
            continue
        }
        
        if nums[i] < second {
            three = nums[i]
            continue
        }else if nums[i] ==  second {
            continue
        }
        
        if nums[i] < first {
            three = second
            second = nums[i]
            continue
        }else if nums[i] == first {
            continue
        }
        
        three = second
        second = first
        first = nums[i]
    }
    
    if three == Int.min {
        return first
    }
    return three
}


var nums = [1, 2, 2, 5, 3, 5]
print(thirdMax(nums))


