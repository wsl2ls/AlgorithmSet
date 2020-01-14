/*
 8. 打家劫舍
 
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
 
 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: 4
 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
      偷窃到的最
 高金额 = 1 + 3 = 4 。
 
 示例 2:
 输入: [2,7,9,3,1]
 输出: 12
 解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
      偷窃到的最高金额 = 2 + 9 + 1 = 12 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/house-robber
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


/*
 针对每一个房屋，有两种选择：偷、不偷
 0,1,2,3,4,5
 如果偷第0号房子
 sum1 = nums[0] + rob([2,3,4,5])
 如果不偷第0号房子
 sum2 = rob([1,2,3,4,5])
 max(sum1, sum2)
 */


/*
 思路1 递归 从前往后偷  时间复杂度O(2^n) 空间复杂度 S(n)  时间复杂度度过高是因为 有太多的重复计算
 */
func rob1(_ nums: [Int]) -> Int {
    if(nums.count == 0) { return 0}
    return rob1(nums, 0)
}
/*
 从第begin号房子开始偷出来的最大金额 (从前往后偷)
 */
func rob1(_ nums: [Int], _ begin: Int) -> Int {
    if begin == nums.count - 1 {
        return nums[begin]
    }
    if begin == nums.count - 2 {
        return max(nums[begin], nums[begin + 1])
    }
    let robCur = nums[begin] + rob1(nums, begin + 2)
    let robNext = rob1(nums, begin + 1)
    return max(robCur, robNext)
}


/*
 思路2 递归 从后往前偷  时间复杂度O(2^n) 空间复杂度 S(n)  时间复杂度度过高是因为 有太多的重复计算
 */
func rob2(_ nums: [Int]) -> Int {
    if(nums.count == 0) { return 0}
    return rob2(nums, nums.count - 1)
}
/*
 从第begin号房子开始偷出来的最大金额 (从后往前偷 )
 */
func rob2(_ nums: [Int], _ begin: Int) -> Int {
    if begin == 0 {
        return nums[0]
    }
    if begin == 1 {
        return max(nums[0], nums[1])
    }
    let robCur = nums[begin] + rob2(nums, begin - 2)
    let robNext = rob2(nums, begin - 1)
    return max(robCur, robNext)
}


/*
 思路3 非递归 时间复杂度O(n) 空间复杂度S(n)
 */
func rob3(_ nums: [Int]) -> Int {
    if(nums.count == 0) { return 0}
    if (nums.count == 1) {return nums[0]}
    
    var array: [Int] = [Int](repeating: 0, count: nums.count)
    array[0] = nums[0]
    array[1] = max(nums[0], nums[1])
    for  i in stride(from: 2, to: array.count, by: 1) {
        array[i] = max(nums[i] + array[i - 2], array[i - 1])
    }
    return array[array.count - 1]
}


/*
 思路4 非递归 时间复杂度O(n) 空间复杂度S(1) 最优解
 */
func rob4(_ nums: [Int]) -> Int {
    if(nums.count == 0) { return 0}
    if (nums.count == 1) {return nums[0]}
    
    var first = nums[0]
    var second = max(nums[0], nums[1])
    for  i in stride(from: 2, to: nums.count, by: 1) {
        let tmp = second
        second = max(nums[i] + first, second)
        first = tmp
    }
    return second
}


print("偷到的最高金额：\(rob4([2,7,9,3,1]))")


