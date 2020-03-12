/* 13. 盛最多水的容器
 
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。
  
 [示意图请看Sources文件夹]

 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

 示例：

 输入：[1,8,6,2,5,4,8,3,7]
 输出：49

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/container-with-most-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

/*
 思路一：暴力法 循环遍历一对一对比较 (不可取)
 时间复杂度O(n^2) 空间复杂度S(1)
 */
func maxArea1(_ height: [Int]) -> Int {
    var maxArea = 0
    for i in (0..<height.count-1) {
        for j in (i+1..<height.count) {
           maxArea = max(maxArea, (j-i)*min(height[i], height[j]))
        }
    }
    print(maxArea)
    return maxArea
}

/*
 思路2：从左右两边柱子向中间靠拢，移动较低的一边
 时间复杂度O(n) 空间复杂度S(1)
 */
func maxArea2(_ height: [Int]) -> Int {
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    while left < right {
        maxArea = max(maxArea, (right-left)*min(height[left], height[right]))
        //移动最低边的柱子
        if height[left] < height[right] {
            left+=1
        }else {
            right-=1
        }
    }
    print(maxArea)
    return maxArea
}

// test
var height =  [1,8,6,2,5,4,8,3,7]
maxArea2(height)


