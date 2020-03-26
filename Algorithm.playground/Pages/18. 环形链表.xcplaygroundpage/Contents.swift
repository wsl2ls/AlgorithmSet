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


//创建环形链表 3->2->0->-4->2  返回链表的头节点  这里假设 val唯一
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


/*
 思路1： 哈希表
 我们可以通过检查一个结点此前是否被访问过来判断链表是否为环形链表
 时间复杂度O(n)  空间复杂度S(n)
 */
func hasCycle1(_ head: ListNode?) -> Bool {
    var headNode = head
    
    //用数组模拟哈希表
    var array: [ListNode?] = []
    while headNode != nil {
        //O(n) 如果是哈希表查询则是O(1)
        let isContains = array.contains { (item) -> Bool in
            return item?.val == headNode?.val
        }
        if isContains {
            return true
        }
        array.append(headNode)
        headNode = headNode?.next
    }
    return false
}

/*
 思路2： 双指针/快慢指针
 通过使用具有 不同速度 的快、慢两个指针遍历链表，空间复杂度可以被降低至O(1)。慢指针每次移动一步，而快指针每次移动两步。
 时间复杂度O(n)  空间复杂度S(1)
 */
func hasCycle2(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil {
        return false
    }
    var slow = head;
    var fast = head?.next
    while slow?.val != fast?.val {
        if fast == nil || fast?.next == nil {
            return false
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}


//test
var has = hasCycle2(creatList())
print(has ? "有环" : "无环")
