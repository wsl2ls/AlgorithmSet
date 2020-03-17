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
 思路1 暴力法
 时间复杂度O(n^3) 空间复杂度S(1)
 */
func threeSum1(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    for i in (0..<nums.count - 2) {
        for j in (i+1..<nums.count - 1) {
            for k in (j+1..<nums.count) {
                if nums[i] + nums[j] + nums[k] == 0 {
                    let abc = [nums[i], nums[j], nums[k]]
                    result.append(abc)
                }
            }
        }
    }
    return result
}


/*
 思路2 排序+双指针
 固定3个指针中最左（最小）数字的指针 k，双指针 i，j 分设在数组索引 [k+1,nums.cout-1] 两端，通过双指针交替向中间移动，记录对于每个固定指针 k 的所有满足 nums[k] + nums[i] + nums[j] == 0 的 i,j 组合。
 时间复杂度O(n^2)  空间复杂度S(1)
 */
func threeSum2(_ nums: inout [Int]) -> [[Int]] {
    var result: [[Int]] = []
    //O(nlog(n)) 改变原数组的顺序
    nums.sort { (num1, num2) -> Bool in
        return num1 < num2
    }
    for k in (0..<nums.count-2) {
        // nums[j] >= nums[i] >= nums[k] > 0
        if nums[k] > 0 {
            break
        }
         //如果当前K值重复，就直接跳过
        if k > 0 && nums[k] == nums[k-1] {
            continue
        }
        if nums.count < 3 {
            return result
        }
        var i = k+1
        var j = nums.count - 1
        while i < j {
            let s = nums[k] + nums[i] + nums[j]
            if s < 0 {
                i+=1
                //如果下一个值重复，就直接指向下一个
                while i < j && nums[i] == nums[i - 1] { i += 1 }
            } else if s > 0 {
                j-=1
                //如果下一个值重复，就直接指向下一个
                while i < j && nums[j] == nums[j - 1] { j -= 1 }
            } else {
                //s == 0
                result.append([nums[k], nums[i], nums[j]])
                i+=1
                j-=1
                //如果下一个值重复，就直接指向下一个
                while i < j && nums[i] == nums[i - 1] { i += 1 }
                while i < j && nums[j] == nums[j - 1] { j -= 1 }
            }
        }
    }
    return result
}


//test
var nums = [-1, 0, 1, 2, -1, -4]
print(threeSum2(&nums))

