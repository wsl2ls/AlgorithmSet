/* 40. Pow(x, n)
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。
 
 示例 1:
 输入: 2.00000, 10
 输出: 1024.00000
 
 示例 2:
 输入: 2.10000, 3
 输出: 9.26100
 
 示例 3:
 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 
 说明:
 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/powx-n
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
分治法 递归
 时间复杂度：O(logn) 空间复杂度：S(logn)
*/
func myPow1(_ x: Double, _ n: Int) -> Double {
    if n == 0 { return 1 }
    var x = x
    var n = n
    if n < 0 {
        x = 1 / x
        n = -n
    }
    let half = myPow1(x, n / 2)
    return half * half * (n % 2 == 1 ? x : 1)
}

/*
 分治法 迭代
 时间复杂度：O(logn) 空间复杂度：S(1)
 */
func myPow2(_ x: Double, _ n: Int) -> Double {
    return n > 0 ? calculate(x, n) : 1.0 / calculate(x, -n)
}
func calculate(_ x: Double, _ n: Int) -> Double {
    var ans = 1.0
    var xcon = x
    var num = n
    while num > 0 {
        if num % 2 == 1 {
            ans *= xcon
        }
        xcon *= xcon
        num /= 2
    }
    return ans
}

print(myPow1(3, 23))
