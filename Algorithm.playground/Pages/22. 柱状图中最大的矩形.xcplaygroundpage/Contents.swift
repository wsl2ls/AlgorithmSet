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
 思路1：暴力法
 时间复杂度O(n^3) 空间复杂度S(1)
 */
func largestRectangleArea1(_ heights: [Int]) -> Int {
    var maxArea = 0
    for i in  (0..<heights.count) {
        for j in (i..<heights.count) {
            var minHieght = Int.max
            for k in (i...j) {
                 minHieght = min(minHieght, heights[k])
            }
            maxArea = max(maxArea, (j-i+1)*minHieght)
        }
    }
    print(maxArea)
    return maxArea
}


/*
 思路2： 对暴力法进行优化  保存前一对柱子的最低高度
 时间复杂度O(n^2) 空间复杂度S(1)
 */
func largestRectangleArea2(_ heights: [Int]) -> Int {
    var maxArea = 0
    for i in  (0..<heights.count) {
        var minHieght = Int.max
        for j in (i..<heights.count) {
            minHieght = min(minHieght, heights[j])
            maxArea = max(maxArea, (j-i+1)*minHieght)
        }
    }
    print(maxArea)
    return maxArea
}

/*
 思路3：栈
 时间复杂度O(n) 空间复杂度S(n)
 */
func largestRectangleArea3(_ heights: [Int]) -> Int {
    var stack: [Int] = []
    var maxArea: Int = 0
    let heights = [0] + heights + [0]
    
    for i in 0..<heights.count {
        while let topIndex = stack.last, heights[topIndex] > heights[i] {
            stack.removeLast()
            maxArea = max(maxArea, heights[topIndex] * (i - stack.last! - 1))
        }
        stack.append(i)
    }
    print(maxArea)
    return maxArea
}


// test
var heighs =  [2,1,5,6,2,3]
largestRectangleArea3(heighs)
