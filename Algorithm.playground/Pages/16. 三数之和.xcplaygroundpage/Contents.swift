/* 16. 三数之和
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 
 示例：
 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 思路1 暴力法  a + b = -c
 时间复杂度O(n^3) 空间复杂度S(1)
 */
func threeSum1(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    for i in (0..<nums.count - 2) {
        for j in (i+1..<nums.count - 1) {
            for k in (j+1..<nums.count) {
                if nums[i] + nums[j] + nums[k] == 0 {
                    var abc = [nums[i], nums[j], nums[k]]
                    result.append(abc)
                }
            }
        }
    }
    return result
}


/*
 思路2 排序+双指针
 时间复杂度O()  空间复杂度S()
 */
func threeSum2(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    //O(nlog(n))
    var sortNums = nums.sorted()
    print(sortNums)
    for i in sortNums {
        
    }
    return result
}


//test
var nums = [-1, 0, 1, 2, -1, -4]
print(threeSum2(nums))

