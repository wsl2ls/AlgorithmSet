/*
 9. 前 K 个高频元素
 给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
 
 示例 1:
 输入: nums = [1,1,1,2,2,3], k = 2
 输出: [1,2]
 
 示例 2:
 输入: nums = [1], k = 1
 输出: [1]
 说明：
 * 你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
 * 你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/top-k-frequent-elements
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


import UIKit

/*
 思路1 遍历排序  时间复杂度O(n+mlogm+k)  空间复杂度S(2m+k)
 */
func topKFrequent1(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = [Int:Int]()  // S(m)
    //遍历储每个元素出现的次数  O(n)
    for num in nums {
        let count: Int = dict[num] ?? 0
        dict[num] = count + 1
    }
    //排序 从大到小 S(m) O(mlogm)  m是数组中不同元素的数量
    let result: [(Int, Int)] = dict.sorted { (num1, num2) -> Bool in
        return num1.1 > num2.1
    }
    //取出前K个  S(k)
    var array = [Int](repeating: 0, count: k)
    for i in (0..<k) {
        array[i] = result[i].0  //O(k)
    }
    return array
}

/*
 思路2 桶排序 时间复杂度O(n+n+m+n) 空间复杂度S(m+n+k)  n数组元素数量  m不同的元素数量
 */
func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int]  {
    var dict = [Int:Int]()  // S(m)
    //遍历存储每个元素出现的次数  O(n)
    for num in nums {
        let count: Int = dict[num] ?? 0
        dict[num] = count + 1
    }
    
    //桶数组 索引是元素出现的次数  O(n)  S(n)
    var bucketArray: [[Int]?] = []
    for _ in (0...nums.count) {
        bucketArray.append([])
    }
    //把各个次数的元素放到对应的桶中  bucketArray[1] 表示所有出现次数为1的元素数组
    // O(m)
    for (key, value) in dict {
        if bucketArray[value] == nil {
            bucketArray.insert([key], at: value)
        }else {
            bucketArray[value]?.append(key)
        }
    }
    
    //取出前K个元素  S(k)  O(n)
    var array: [Int] = []
    for i in (0..<bucketArray.count).reversed() {
        if array.count >= k  {
            break;
        }
        if array.count + bucketArray[i]!.count <= k  {
            array += bucketArray[i]!
        }else {
            array += bucketArray[i]![0..<(k-array.count)]
        }
    }
    return array
}

//print(topKFrequent2([6,0,1,4,9,7,-3,1,-4,-8,4,-7,-3,3,2,-3,9,5,-4,0], 6))

print(topKFrequent2([1,1,1,2,2,3], 2))
