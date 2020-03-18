/* 17. 反转链表
 反转一个单链表。
 
 示例:
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
//创建测试链表 1->2->3->4->5  返回链表的头节点
func creatList () -> ListNode? {
    let node1: ListNode? = ListNode.init(1)
    let node2: ListNode? = ListNode.init(2)
    let node3: ListNode? = ListNode.init(3)
    let node4: ListNode? = ListNode.init(4)
    let node5: ListNode? = ListNode.init(5)
    node1?.next = node2
    node2?.next = node3
    node3?.next = node4
    node4?.next = node5
    return node1
}


/*
 思路1：迭代
 时间复杂度O(n) 空间复杂度S(1)
 */
func reverseList1(_ head: ListNode?) -> ListNode? {
    var preNode: ListNode?
    var currentNode: ListNode? = head
    while currentNode?.next != nil {
        let nextTemp = currentNode?.next
        currentNode?.next = preNode
        preNode = currentNode
        currentNode = nextTemp
    }
    currentNode?.next = preNode
    return currentNode
}


/*
 思路2：递归  1->2->3->4->5
 时间复杂度O(n) 空间复杂度S(n)
 */
func reverseList2(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let p = reverseList2(head?.next)
    head?.next?.next = head
    head?.next = nil
    return p
}


//test
//输出新链表
var nextNode: ListNode? = reverseList(creatList())
var string: String = ""
while nextNode != nil {
    string.append("\(nextNode!.val)->")
    nextNode = nextNode?.next
}
print("合并后的链表：\(string)")


