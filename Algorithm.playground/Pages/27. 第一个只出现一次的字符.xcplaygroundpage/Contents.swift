/* 27. 第一个只出现一次的字符
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。
 
 示例:
 
 s = "abaccdeff"
 返回 "b"
 
 s = ""
 返回 " "
  
 限制：
 0 <= s 的长度 <= 50000
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 时间复杂度O(n) 空间复杂度S(n)
 */
func firstUniqChar(_ s: String) -> Character {
    //用字典存储每一个元素的出现次数
    var dict = [Character:Int]()
    for i in s {
        if let v = dict[i] {
            dict[i] = v + 1
        } else {
            dict[i] = 1
        }
    }
    //从字典中取出出现次数为1的元素 字典的底层是哈希表，查找速度为O(1)
    for i in s {
        if let v = dict[i] {
            if v == 1 {
                return i
            }
        }
    }
    return " "
}

print(firstUniqChar("abaccdeff"))
