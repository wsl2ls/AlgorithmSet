/*
 
 根据逆波兰表示法，求表达式的值。(即后缀表达式:https://baike.baidu.com/item/逆波兰式/128437)
 
 有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
 
 说明：
 * 整数除法只保留整数部分。
 * 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。
 
 示例 1：
 输入: ["2", "1", "+", "3", "*"]
 输出: 9
 解释: ((2 + 1) * 3) = 9
 
 示例 2：
 
 输入: ["4", "13", "5", "/", "+"]
 输出: 6
 解释: (4 + (13 / 5)) = 6
 
 示例 3：
 
 输入: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
 输出: 22
 解释:
 ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/evaluate-reverse-polish-notation
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

import Foundation

//判断是否是操作符
func isOperator(string: String) -> Bool {
    return ("+-*/" as NSString).contains(string)
}

// 计算每一项的结果： 左操作数 操作符 右操作数 = 值
func calculate(left: Int, right: Int, operatorStr: String) -> Int {
    switch operatorStr {
    case "+":
        return left + right
    case "-":
        return left - right
    case "*":
        return left * right
    case "/":
        return left / right
    default:
        return 0
    }
}

//返回逆波兰表达式的值
func evalRPN(tokens: [String] ) -> Int {
    //数组 模拟 栈
    var stack: [Int] = [];
    
    for string in tokens {
        //操作符
        if isOperator(string: string) {
            // 右操作数
            let right = stack.last
            //出栈
            stack.removeLast();
            // 左操作数
            let left = stack.last;
            //出栈
            stack.removeLast();
            //把计算结果入栈
            let value = calculate(left: left!, right: right!, operatorStr: string);
            stack.append(value);
        }else {
            //入栈
            stack.append(Int(string)!)
        }
    }
    return stack.first!
}

// 输入的逆波兰表达式
let input = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]

let value = evalRPN(tokens: input)

print("逆波兰表达式 \(input) \n值：\(value)")
