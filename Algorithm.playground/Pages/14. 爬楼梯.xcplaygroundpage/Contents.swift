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
 思路1 递归法
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
 思路3  动态规划
 第 i 阶可以由以下两种方法得到：
 1. 在第(i−1)阶后向上爬1阶
 2. 在第(i−2) 阶后向上爬 2 阶
 所以到达第i阶的方法总数就是到第(i-1)阶和第(i-2)阶的方法数之和。
 那么dp[i] 表示能到达第i阶的放大总数：dp[i] = dp[i-1] + dp[i-2]
 时间复杂度O(n) 空间复杂度S(n)
 */
func climbStairs3(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    var dp = Array(repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    for i in (3...n) {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

/*
 思路4 斐波那契数
 时间复杂度O(n) 空间复杂度S(1)
 */
func climbStairs4(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    var first = 1
    var second = 2
    for _ in (3...n) {
        let third = first + second
        first = second
        second = third
    }
    return second
}

/*
 思路5 斐波那契公式  (示意图Sources目录)
 时间复杂度O(log(n)) 空间复杂度S(1)
 */
func climbStairs5(_ n: Int) -> Int {
    return 0;
}

//test
var n = 4
print(climbStairs4(n))


