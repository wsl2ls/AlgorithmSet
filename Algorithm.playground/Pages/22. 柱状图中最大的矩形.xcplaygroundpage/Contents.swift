/*
 22. 柱状图中最大的矩形
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
 求在该柱状图中，能够勾勒出来的矩形的最大面积。

 [Sources/柱状图中最大的矩形1]
 以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。

 [Sources/柱状图中最大的矩形2]
 图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。

 示例:
 输入: [2,1,5,6,2,3]
 输出: 10

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/largest-rectangle-in-histogram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 思路1：
 时间复杂度O(n) 空间复杂度S(1)
 */
func largestRectangleArea(_ heights: [Int]) -> Int {
    if heights.count == 1 {
        return heights.first!
    }
    var maxArea = 0
    var left = 0
    var right = heights.count - 1
    while left < right {
        maxArea = max(maxArea, (right-left+1)*min(heights[left], heights[right]))
        print(maxArea)
        //移动最低边的柱子
        if heights[left] < heights[right] {
            left+=1
        }else {
            right-=1
        }
    }
    print(maxArea)
    return maxArea
}

// test
var heighs =  [2,1,5,6,2,3]
largestRectangleArea(heighs)
