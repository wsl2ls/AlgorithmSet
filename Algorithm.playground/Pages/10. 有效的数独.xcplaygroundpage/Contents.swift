
/*
 10. 有效的数独
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 
 1.数字 1-9 在每一行只能出现一次。
 2.数字 1-9 在每一列只能出现一次。
 3.数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 
 示例1
 输入:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 输出: true
 
 示例2
 输入:
 [
   ["8","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 输出: false
 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
 但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 
 说明:
 
 * 一个有效的数独（部分已被填充）不一定是可解的。
 * 只需要根据以上规则，验证已经填入的数字是否有效即可。
 * 给定数独序列只包含数字 1-9 和字符 '.' 。
 * 给定数独永远是 9x9 形式的。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-sudoku
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

//初始化一个数独数组
let board: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]



/*
 思路1  逐一验证每行、每列、每个3*3宫格 时间复杂度O(9*9)  空间复杂度S(9*9*3)
 */
func isValidSudoku1(_ board: [[Character]]) -> Bool {
    //行数组  S(9*9)
    var rows: [[Character]] = [[Character]](repeating: [], count: 9)
    //列数组 S(9*9)
    var columns: [[Character]] = [[Character]](repeating: [], count: 9)
    //3*3宫格数组  S(9*9)
    var boxes: [[Character]] = [[Character]](repeating: [], count: 9)
    
    //遍历每一个元素
    for row in (0..<9) {
        for column in (0..<9) {
            let num = board[row][column]
            guard num != "." else {
                continue
            }
            //contains函数也耗时 时间复杂度O(n)
            if rows[row].contains(num) { return false }
            if columns[column].contains(num) { return false }
            let boxeIndex = (row/3)*3+column/3
            if boxes[boxeIndex].contains(num) { return false }
            rows[row].append(num)
            columns[column].append(num)
            boxes[boxeIndex].append(num)
        }
    }
    return true
}


/*
 思路2  逐一验证每行、每列、每个3*3宫格  时间复杂度O(9*9*9)  空间复杂度S(3*9)
 */
func isValidSudoku2(_ board: [[Character]]) -> Bool {
    //每一行 S(9)
    var rows: [Character] = [Character](repeating: ".", count: 9)
    //每一列 S(9)
    var columns: [Character] = [Character](repeating: ".", count: 9)
    //每个3*3宫格数组 S(9)
    var boxes: [Character] = [Character](repeating: ".", count: 9)
    
    //遍历每一个元素
    for i in (0..<9) {
        //清空
        rows.removeAll()
        columns.removeAll()
        for j in (0..<9) {
            //i行j列
            let rowNum = board[i][j]
            //j行i列
            let columnNum = board[j][i]
            // 验证i行是否有重复元素
            if rowNum == "." {
            }else {
                if rows.contains(rowNum) {
                    return false
                }else {
                    rows.append(rowNum)
                }
            }
            // 验证i列是否有重复元素
            if columnNum == "." {
            }else {
                if columns.contains(columnNum) {
                    return false
                }else {
                    columns.append(columnNum)
                }
            }
            
            //验证每个3*3九宫格
            if i%3 == 0 && j%3 == 0 {
                boxes.removeAll()
                for index in (0..<9) {
                    let boxeNum = board[i+index/3][j+index%3]
                    //                    print(boxeChar)
                    if boxeNum == "." {
                    }else {
                        if boxes.contains(boxeNum) {
                            return false
                        }else {
                            boxes.append(boxeNum)
                        }
                    }
                    
                }
            }
            
        }
    }
    return true
}


/*
 思路3 Bool值 存储每个元素的状态
 */
func isValidSudoku3(_ board: [[Character]]) -> Bool {
    
    let nums: [Bool] = [Bool](repeating: false, count: 9)
    //行数组
    var rows: [[Bool]] = [[Bool]](repeating: nums, count: 9)
    //列数组
    var columns: [[Bool]] = [[Bool]](repeating: nums, count: 9)
    //九宫格数组
    var boxes: [[Bool]] = [[Bool]](repeating: nums, count: 9)
    
    //遍历每一个元素
    for row in (0..<9) {
        for column in (0..<9) {
            let char: Character = board[row][column]
             guard char != "." else {
                continue
            }
            let num: Int = Int("\(char)")! - 1
            if rows[row][num] { return false }
            if columns[column][num] { return false }
            let boxeIndex = (row/3)*3+column/3
            if boxes[boxeIndex][num] { return false }
            rows[row][num] = true
            columns[column][num] = true
            boxes[boxeIndex][num] = true
        }
    }
    
    return true
}

print("数独是否有效：\(isValidSudoku2(board))")
