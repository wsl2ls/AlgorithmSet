
/*
 4.  验证二叉搜索树
 
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 
 假设一个二叉搜索树具有如下特征：
 1. 节点的左子树只包含小于当前节点的数。
 2. 节点的右子树只包含大于当前节点的数。
 3. 所有左子树和右子树自身必须也是二叉搜索树。
 
 示例 1:
 
 输入:
 2
 / \
 1   3
 输出: true
 示例 2:
 
 输入:
  5
 / \
 1   4
    / \
    3  6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/validate-binary-search-tree
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

/* 初始化创建一个二叉树
  5
 / \
 1   4
    / \
    3  6
 */
func creatBinaryTree() -> TreeNode {
    let tree5 = TreeNode.init(5)
    let tree1 = TreeNode.init(1)
    let tree4 = TreeNode.init(4)
    let tree3 = TreeNode.init(3)
    let tree6 = TreeNode.init(6)
    
    tree5.left = tree1
    tree5.right = tree4
    tree4.left = tree3
    tree4.right = tree6
    
    return tree5
}


/* 思路1 - 中序遍历 (左-root-右)
 * 时间复杂度 O(n) 空间复杂度 S(n)  n: 节点总数
 * 二叉搜索树的中序遍历结果必然是升序的
 */
public var lastVal = Int.min
func isValidBST1(_ root: TreeNode?) -> Bool {
    //空树
    if root ==  nil { return true }
    //验证左子树是否是二叉搜索树
    if !isValidBST1(root?.left) { return false }
    //保存前一次遍历的值
    if  lastVal != Int.min && root!.val <= lastVal  { return false }
    lastVal = root!.val
    //验证右子树是否是二叉搜索树
    if !isValidBST1(root?.right) { return false}
    return true
}


/* 思路2 - 遍历的同时指定范围
 * 时间复杂度 O(n) 空间复杂度 S(n)  n: 节点总数
 * 在遍历每一个节点的时候，都指定它的上界和下界，节点的取值范围（下界， 上界）
 * 这种思路适合所有的遍历方式（前序、中序、后序、层序）
 */
func isValidBST2(_ root: TreeNode?) -> Bool {
    // 采用前序遍历的方式  树根的上线和下线：是无穷小 和 无穷大
    return isValidBST2(root, Int.min, Int.max)
}
//判断每个节点的值是否超出 下界 和 上界
func isValidBST2(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
    //空树
    if root ==  nil { return true }
    if min != Int.min && root!.val <= min {
        return false
    }
    if max != Int.max && root!.val >= max {
        return false
    }
    if !isValidBST2(root?.left, min, root!.val) {
        return false
    }
    if !isValidBST2(root?.right, root!.val, max) {
        return false
    }
    return true
}


//输出验证结果
print("二叉搜索树验证结果：\(isValidBST2(creatBinaryTree()))")
