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
    let tree1 = TreeNode.init(1)
    let tree2 = TreeNode.init(2)
    let tree3 = TreeNode.init(3)
    let tree4 = TreeNode.init(4)
    let tree5 = TreeNode.init(5)
    let tree6 = TreeNode.init(6)
    
    tree1.left = tree2
    tree1.right = tree5
    tree2.left = tree3
    tree2.right = tree4
    tree5.right = tree6
    
    return tree1
}


//思路1. 前序遍历  时间复杂度O(nlogn)
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

//思路2. 时间复杂度O(nlogn)  空间复杂度S(1)
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

// 思路3. 后序遍历 时间复杂度O(n)  空间复杂度S(n)
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


