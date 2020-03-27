/*
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 示例 1: 输入: "()"
 输出: true
 示例 2: 输入: "()[]{}"
 输出: true
 示例 3: 输入: "(]"
 输出: false
 示例 4: 输入: "([)]"
 输出: false
 示例 5: 输入: "{[]}"
 输出: true
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 思路1： 栈  用数组模拟栈
 时间复杂度O(n) 空间复杂度S(n)
 */
func isValid1(_ s: String) -> Bool {
    //用数组模拟栈
    var stack:[Character] = []
    for char in s {
        switch stack.last {
        case "(":
            if char == ")" {
                //匹配出栈
                stack.removeLast()
                continue
            }
            break
        case "[":
            if char == "]" {
                //匹配出栈
                stack.removeLast()
                continue
            }
            break
        case "{":
            if char == "}" {
                //匹配出栈
                stack.removeLast()
                continue
            }
            break
        default:
            break
        }
        //不匹配进栈
        stack.append(char)
    }
    
    if stack.count == 0 {
        return true
    }else {
        return false
    }
}

/*
 思路2： 指针  跟思路1差不多，直接对操作字符串，会改变源字符串
 时间复杂度O(n) 空间复杂度S(1)
 */
func isValid2(_ s: inout String) -> Bool {
    var index = 0
    while index < s.count {
        if index - 1 < 0 {
            index += 1
        }
        let preIndex = s.index(s.startIndex, offsetBy: (index-1))
        let preChar = s[preIndex]
        
        let curIndex = s.index(s.startIndex, offsetBy: (index))
        let curChar = s[curIndex]
        
        switch preChar {
        case "(":
            if curChar == ")" {
                //匹配出栈
                index -= 1
                s.removeSubrange(preIndex...curIndex)
                continue
            }
            break
        case "[":
            if curChar == "]" {
                //匹配出栈
                index -= 1
                s.removeSubrange(preIndex...curIndex)
                continue
            }
            break
        case "{":
            if curChar == "}" {
                //匹配出栈
                index -= 1
                s.removeSubrange(preIndex...curIndex)
                continue
            }
            break
        default:
            break
        }
        //不匹配进栈
        index += 1
    }
    
    if s.count == 0 {
        return true
    }else {
        return false
    }
}


//test
var string = "()[()]{}"

print(isValid2(&string))
