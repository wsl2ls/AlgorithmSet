/*
 
 11. 数组排序
 给定一个整数数组 nums，将该数组升序排列。
 
 示例 1：
 输入：[5,2,3,1]
 输出：[1,2,3,5]
 示例 2：
 输入：[5,1,1,2,0,0]
 输出：[0,0,1,1,2,5]
 
 常见排序的几种思想：
 1. 插入式排序：直接插入排序 、希尔排序
 2. 交换式排序：冒泡排序、快速排序
 3. 选择排序： 直接选择排序、堆排序
 4. 归并排序
 5. 基数排序
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


//初始化一个待排序的数组
var nums = [5,0,3,54,1,11,9,8,9,-1,21,2,32,63]

/*
 1. 直接插入排序  时间复杂度O(n^2) 空间复杂度S(0)  稳定
 思想：将每一步待排序的元素，按照大小插入到之前已遍历排序的数组中
 */
func sortArray1(_ nums: inout [Int]) -> [Int] {
    //O(n)
    for i in (0..<nums.count) {
        let num = nums[i]
        if i > 0 {
            if num >= nums[i-1]{
                continue
            }
        }
        //O(n)
        for j in (0..<i) {
            // 如果<= 就不稳定了
            if num < nums[j]{
                nums.remove(at: i)
                nums.insert(num, at: j)
                break
            }
        }
    }
    return nums
}

/*
 2. 希尔排序/缩小增量排序   时间复杂度O(n^(1.3-2)) 空间复杂度S(1)  不稳定
思想：希尔排序是把记录按下标的一定增量分组，对每组使用直接插入排序算法排序；随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止
 */
func sortArray2(_ nums: inout [Int]) -> [Int] {
//     NSMutableArray *unSortArray = [unsortDatas mutableCopy];
//       int len = (int)unSortArray.count;
//       for (int gap = floor(len / 2); gap > 0; gap = floor(gap/2)) {
//           for (int i = gap; i < len; i++) {
//               for (int j = i - gap; j >= 0 && [unSortArray[j] intValue] > [unSortArray[j+gap] intValue]; j-=gap) {
//                   NSNumber *temp = unSortArray[j];
//                   unSortArray[j] = unSortArray[gap+j];
//                   unSortArray[gap+j] = temp;
//               }
//           }
//       }
//       return [unSortArray copy];
    
//    for <#item#> in <#items#> {
//        <#code#>
//    }
    
    
    return nums
}

/*
 3. 冒泡排序 时间复杂度O(n^2) 稳定
 思想：两两比较交换位置 ，每一轮把比较大的依次往后放
 */
func sortArray3(_ nums: inout [Int]) -> [Int] {
    for i in (0..<nums.count) {
        for j in (0..<nums.count-i) {
            if j == 0 { continue }
            if nums[j] < nums[j-1] {
                nums.swapAt(j-1,j)
            }
        }
    }
    return nums
}

/*
 4. 快速排序  时间复杂度O(nlogn) 空间复杂度S(logn)  不稳定
 思想：以某一个数据为基准(例如第1个)，将整个序列划分为左右两个子序列，左边的都比基准值小，右边的都不小于基准值
 */
func sortArray4(_ nums: inout [Int]) -> [Int] {
    quickSort(&nums, left: 0, right: nums.count-1)
    return nums
}
//递归排序
func quickSort(_ nums: inout [Int], left: Int, right: Int) {
    guard left<=right else {
        return
    }
    //基准点
    let pivotIndex = partition(&nums, left: left, right: right)
    //左序列排序
    quickSort(&nums, left: left, right: pivotIndex-1)
    //右序列排序
    quickSort(&nums, left: pivotIndex+1, right: right)
}
//划分为左右两个子序列
func partition(_ nums: inout [Int],  left: Int, right: Int) -> Int {
    var left = left
    var right = right
    //基准值
    let pivot = nums[left]
    
    while left<right {
        // 从右边开始比较，比pivot大的数位置不变
        while left<right, nums[right]>=pivot {
            right -= 1
        }
        //只要出现一个比pivot小的数，将这个数放入左边left的位置
        nums[left] = nums[right]
        
        //从左边开始比较，比pivot小的数位置不变
        while left<right, nums[left]<pivot {
            left += 1
        }
        //大的放到右边
        nums[right] = nums[left]
    }
    //将pivot放入left的位置，则左侧数都比pivot小，右侧数都比pivot大
    nums[left] = pivot
    return left
}

print(sortArray4(&nums))

