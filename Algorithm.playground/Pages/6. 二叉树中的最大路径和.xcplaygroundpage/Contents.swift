/*
 6. 二叉树中的最大路径和
 给定一个非空二叉树，返回其最大路径和。

 本题中，路径被定义为一条从树中任意节点出发，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。

 示例 1:
 输入: [1,2,3]

        1
       / \
      2   3

 输出: 6
 示例 2:

 输入: [-10,9,20,null,null,15,7]

    -10
    / \
   9  20
     /  \
    15   7

 输出: 42


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-maximum-path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

//树节点
public class TreeNode {
    public var val: Int
    public var left: TreeNode? //左节点
    public var right: TreeNode? // 右节点
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
/*
 初始化创建一个二叉树
 */
func creatBinaryTree() -> TreeNode {
    let tree10 = TreeNode.init(-10)
    let tree9 = TreeNode.init(9)
    let tree20 = TreeNode.init(20)
    let tree15 = TreeNode.init(15)
    let tree7 = TreeNode.init(7)
    
    tree10.left = tree9
    tree10.right = tree20
    tree20.left = tree15
    tree20.right = tree7
    
    return tree10
}

//和
public var sum: Int = Int.min
// 计算每个节点node提供给父节点的最大路径值  类似于后序遍历
func value(_ node: TreeNode?) -> Int{
    if(node == nil) {return 0}
    let leftV = max(value(node?.left), 0)
    let rightV = max(value(node?.right), 0)
    sum = max(sum, node!.val + leftV + rightV)
    return node!.val + max(leftV, rightV)
}

//二叉树中的最大路径和  时间复杂度O(n)  空间复杂度S(n)
func maxPathSum(_ root: TreeNode?) -> Int {
    value(root)
    return sum
}


print("最大路径和 = \(maxPathSum(creatBinaryTree()))")

