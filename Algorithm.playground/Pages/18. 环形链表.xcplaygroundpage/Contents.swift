/* 18. 环形链表
 给定一个链表，判断链表中是否有环。
 
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 示例图在【Source】
 示例 1：
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 示例 2：
 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 
 示例 3：
 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。

 
 进阶：你能用 O(1)（即，常量）内存解决此问题吗？
 
 https://leetcode-cn.com/problems/linked-list-cycle/
 */

//链表节点
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//创建环形链表 3->2->0->-4->2  返回链表的头节点
func creatList () -> ListNode? {
    let node3: ListNode? = ListNode.init(3)
    let node2: ListNode? = ListNode.init(2)
    let node0: ListNode? = ListNode.init(0)
    let node4: ListNode? = ListNode.init(-4)
    node3?.next = node2
    node2?.next = node0
    node0?.next = node4
    //    let pos = 1
    node4?.next = node2
    return node3
}


func hasCycle(_ head: ListNode?) -> Bool {
    
    
    
    
    return false
}


//test
var has = hasCycle(creatList())
print(has ? "有环" : "无环")
