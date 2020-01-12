/*
 5. 二叉树的前中后层序遍历
 概念： 数据结构与算法 - 树形结构： https://www.jianshu.com/p/c545c93f2585
 
 输入:
     5
   /   \
  1     4
 / \   / \
2  7   3  6
 
 输出:
 前序遍历：5 1 2 7 4 3 6
 中序遍历：2 1 7 5 3 4 6
 后序遍历：2 7 1 3 6 4 5
 层序遍历：5 1 4 2 7 3 6
 
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
    let tree5 = TreeNode.init(5)
    let tree1 = TreeNode.init(1)
    let tree2 = TreeNode.init(2)
    let tree7 = TreeNode.init(7)
    let tree4 = TreeNode.init(4)
    let tree3 = TreeNode.init(3)
    let tree6 = TreeNode.init(6)
    
    tree5.left = tree1
    tree5.right = tree4
    tree4.left = tree3
    tree4.right = tree6
    tree1.left = tree2
    tree1.right = tree7
    
    return tree5
}

//前序遍历
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else { return [] }
    res.append(root.val)
    res += preorderTraversal(root.left)
    res += preorderTraversal(root.right)
    return res
}

//中序遍历
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else { return [] }
    res += inorderTraversal(root.left)
    res.append(root.val)
    res += inorderTraversal(root.right)
    return res
}

//后序遍历
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else { return [] }
    res += postorderTraversal(root.left)
    res += postorderTraversal(root.right)
    res.append(root.val)
    return res
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


print("前序遍历:\(preorderTraversal(creatBinaryTree()))")
print("中序遍历:\(inorderTraversal(creatBinaryTree()))")
print("后序遍历:\(postorderTraversal(creatBinaryTree()))")
print("层序遍历:\(levelOrder(creatBinaryTree()))")




