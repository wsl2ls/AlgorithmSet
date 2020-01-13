/*
 7. 二叉树展开为链表
 给定一个二叉树，原地将它展开为链表。

 例如，给定二叉树

     1
    / \
   2   5
  / \   \
 3   4   6
 
 将其展开为：
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list
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


//方法1 原地将它展开为链表  思路 前序遍历
func flatten1(_ root: TreeNode?) {
    if root == nil {
        return
    }
    //保留之前的right
    let oldRight = root?.right
    //将left嫁接到right
    root?.right = root?.left
    //清空left
    root?.left = nil
    // 将旧的right嫁接到root的最右下角
    var rightMost = root
    while rightMost?.right != nil {
        rightMost = rightMost?.right
    }
    rightMost?.right = oldRight
    flatten1(root?.right)
}

//方法2
func flatten2(_ root: inout TreeNode?) {
    while root != nil {
        if root?.left != nil {
            //保留之前的right
            let oldRight = root?.right
            //将left嫁接到right
            root?.right = root?.left
            //清空left
            root?.left = nil
            //将旧的right嫁接到root的最右下角
            var rightMost = root
            while rightMost?.right != nil {
                rightMost = rightMost?.right
            }
            rightMost?.right = oldRight
        }
        root = root?.right
    }
}

// 思路3 后序遍历 时间复杂度O(n)
//上一个节点
var prevNode: TreeNode?
func flatten3(_ root: TreeNode?) {
    if root == nil {
        return
    }
    flatten3(root?.right)
    flatten3(root?.left)
    if prevNode != nil {
        root?.right = prevNode
        root?.left = nil
    }
    prevNode = root
}

