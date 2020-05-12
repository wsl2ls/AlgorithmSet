/*
 15. 两数之和
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 思路1 暴力法
 时间复杂度O(n^2) 空间复杂度S(1)
 */
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    for i in (0..<nums.count) {
        for j in ((i+1)..<nums.count) {
            if nums[i] + nums[j] == target {
                return [i,j]
            }
        }
    }
    return []
}

/*
 思路2  哈希表 nums是否包含 b = target - a
 时间复杂度O(n) 空间复杂度S(n)
 */
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    var container = Set<Int>()
    for (index, value) in nums.enumerated() {
        let match = target - value
        if container.contains(match) {
            let first  = nums.firstIndex(of: match)!
            result.append(first)
            result.append(index)
            break
        }
        container.insert(value)
    }
    return result
}



//test
var nums = [2, 7, 11, 15]
var target = 9
print(twoSum2(nums,9))

