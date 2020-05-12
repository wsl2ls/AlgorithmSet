
/*
 39. 括号生成
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 示例：
 输入：n = 3
 输出：[
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


func generateParenthesis(_ n: Int) -> [String] {
    var result: [String] = []
    generate(n, left: 0, right: 0, current: "", result: &result)
    return result
}

private func generate(_ n: Int, left: Int, right: Int, current: String, result: inout [String]) {
    if left == n && right == n {
        result.append(current)
        return
    }
    
    if left < n {
        generate(n, left: left + 1, right: right, current: current + "(", result: &result)
    }
    
    if left > right {
        generate(n, left: left, right: right + 1, current: current + ")", result: &result)
    }
}

var array = generateParenthesis(3)
print(array)
