/* 24. 翻转二叉树
 翻转一棵二叉树。
 示例：
    输入：
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
     输出：
      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 备注:
 这个问题是受到 Max Howell 的 原问题 启发的 ：
 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/invert-binary-tree
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
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 */
func creatBinaryTree() -> TreeNode {
    let tree4 = TreeNode.init(4)
    let tree2 = TreeNode.init(2)
    let tree7 = TreeNode.init(7)
    let tree1 = TreeNode.init(1)
    let tree3 = TreeNode.init(3)
    let tree6 = TreeNode.init(6)
    let tree9 = TreeNode.init(9)
    
    tree4.left = tree2
    tree4.right = tree7
    tree2.left = tree1
    tree2.right = tree3
    tree7.left = tree6
    tree7.right = tree9
    
    return tree4
}

/*
 递归 时间复杂度O(n) 空间复杂度S(n)
 */
func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root?.left == nil && root?.right == nil {
        return root
    }
    let temp = root?.left
    root?.left = root?.right
    root?.right = temp
    invertTree(root?.left)
    invertTree(root?.right)
    return  root
}


// 层序遍历
var res: [Int] = []
func levelOrder(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    levelNode([root])
    return res
}
func levelNode(_ nodes: [TreeNode?] ){
    if nodes.count == 0 {
        return
    }
    var newNodes: [TreeNode?] = []
    for node in nodes {
        res.append(node!.val)
        if node?.left != nil {
            newNodes.append(node?.left)
        }
        if node?.right != nil {
            newNodes.append(node?.right)
        }
    }
    levelNode(newNodes)
}

let rootNode = invertTree(creatBinaryTree())
print(levelOrder(rootNode))
