
/* 12.移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/move-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


/*
 思路1： 一次遍历
 我们创建两个指针i和j，i是每次遍历到的元素指针，j是待赋值的指针，如果遍历到的是非0元素则向j元素赋值
 
 时间复杂度O(n) 空间复杂度S(1)
 */
func moveZeroes1(_ nums: inout [Int]) {
    //指向待赋值的元素
    var j = 0
    for i in (0..<nums.count) {
        //当遍历到非0元素时，就把i元素赋值给j元素，然后j指向下一个元素空间
        if nums[i] != 0 {
            nums[j] = nums[i]
            if j != i {
               nums[i] = 0
            }
            j+=1
        }
    }
    print(nums)
}

/*
 思路2： 一次遍历
 我们创建两个指针i和j，j指向第一个0元素，然后每遍历到一个非零元素，就与之交换，然后更新j指针
 
 时间复杂度O(n) 空间复杂度S(1)
 */
func moveZeroes2(_ nums: inout [Int]) {
    //指向最靠前的0元素
    var j = 0
    for i in (0..<nums.count) {
        //当遍历到非0元素时，就把i元素和j元素交换位置
        if nums[i] != 0 {
            //交换两个元素的位置
            nums.swapAt(i, j)
            j+=1
        }else {
            if j > i {
                j = i
            }
        }
    }
    print(nums)
}

/*
 思路3： 二次遍历
 统计0的个数，如果count大于0，将非0元素直接移到当前位置减去0元素个数的位置上，将当前元素用0填充。
 
 时间复杂度O(n) 空间复杂度S(1)
 */
func moveZeroes3(_ nums: inout [Int]) {
    if nums.count == 1 {
        return;
    }
    //0的数量
    var count = 0
    for i in (0..<nums.count) {
        if(nums[i] == 0) {
            count+=1
            continue;
        }
        nums[i-count] = nums[i]
    }
    for j in ((nums.count-count)..<nums.count) {
        nums[j] = 0
    }
    print(nums)
}



//test
var nums = [0,1,0,3,12]
moveZeroes2(&nums)
