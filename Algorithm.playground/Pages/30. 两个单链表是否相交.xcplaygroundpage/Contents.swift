
/* 30. 两个单链表是否相交
 两个单链表的是否相交且返回相交的第一个结点
 
 示例1
 List1:  5->4->3->2->1
 List2:  8->7->6->3->2->1
 输出第一个相交节点：3
 
 示例2:
 List1:  5->4->3->2->1
 List2:  8->7->6->10
 输出第一个相交节点：nil 表示没有相交点
 
 注意：
 如果两个链表没有交点，返回 null.
 在返回结果后，两个链表仍须保持原有的结构。
 可假定整个链表结构中没有循环。
 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists-lcci/
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

//创建链表1  5->4->3->2->1  返回链表的头节点
let node5: ListNode? = ListNode.init(5)
let node4: ListNode? = ListNode.init(4)
let node3: ListNode? = ListNode.init(3)
let node2: ListNode? = ListNode.init(2)
let node1: ListNode? = ListNode.init(1)
node5?.next = node4
node4?.next = node3
node3?.next = node2
node2?.next = node1

//创建链表2  8->7->6->3->2->1  返回链表的头节点
let node8: ListNode? = ListNode.init(8)
let node7: ListNode? = ListNode.init(7)
let node6: ListNode? = ListNode.init(6)
node8?.next = node7
node7?.next = node6
node6?.next = node3
node3?.next = node2
node2?.next = node1


/*
 思路：双指针法  a+b = b+a
 * 创建两个指针 pA 和 pB，分别初始化为链表 A 和 B 的头结点。然后让它们向后逐结点遍历。
 * 当pA 到达链表的尾部时，将它重定位到链表 B 的头结点 (你没看错，就是链表 B); 类似的，当 pB 到达链表的尾部时，将它重定位到链表 A 的头结点。
 * 若在某一时刻 pA 和 pB 相遇，则 pA/pB 为相交结点。
 时间复杂度O(m+n) 空间复杂度S(1)
 */
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var currNodeA = headA
    var currNodeB = headB
    var isEndA = false
    var isEndB =  false
    
    while currNodeA != nil && currNodeB != nil {
        if currNodeA?.val == currNodeB?.val {
            return currNodeA
        }
        if (currNodeA?.next == nil && isEndA == true) && (currNodeB?.next == nil && isEndB == true) {
            return nil
        }
        currNodeA = currNodeA?.next != nil ? currNodeA?.next : headB
        currNodeB = currNodeB?.next != nil ? currNodeB?.next : headA
        if  currNodeA?.next == nil{
            isEndA = true
        }
        if  currNodeB?.next == nil{
            isEndB = true
        }
    }
    return nil
}

var node = getIntersectionNode(node5, node8)
print(node?.val)
