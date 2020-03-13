/*
 14. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 注意：给定 n 是一个正整数。
 
 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


/*
 思路一 递归法
 时间复杂度O(2^n)  空间复杂度S(n) 递归的深度可以达到n
 */
func climbStairs1(_ n: Int) -> Int {
    return climbStairs1(0, n)
}
//i是当前台阶，而n是目标总阶数
func climbStairs1(_ i: Int , _ n: Int) -> Int {
    if i > n {
        return 0
    }
    if i == n {
        return 1
    }
    return climbStairs1(i+1,n) + climbStairs1(i+2,n)
}


/*
 思路2  记忆化递归 缓存计算过的内容
 时间复杂度O(n) 空间复杂度S(n)
 */
func climbStairs2(_ n: Int) -> Int {
    var cache: [Int] = Array.init(repeating: 0, count: n+1)
    return climbStairs2(0, n, &cache)
}
//i是当前台阶，而n是目标总阶数
func climbStairs2(_ i: Int , _ n: Int, _ cache: inout [Int]) -> Int {
    if i > n {
        return 0
    }
    if i == n {
        return 1
    }
    if cache[i] > 0 {
        return cache[i]
    }
    cache[i] = climbStairs2(i+1,n,&cache) + climbStairs2(i+2,n,&cache)
    return cache[i]
}

/*
 思路3  记忆化递归 缓存计算过的内容
 时间复杂度O() 空间复杂度S()
 */
func climbStairs3(_ n: Int) -> Int {
    return 0
}

//test
var n = 3
print(climbStairs3(n))


