
/*
 2. 合并两个有序链表
 <==> 类似于合并两个有序数组
 
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

import Foundation

//链表节点
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//创建链表1  1->2->4  返回链表的头节点
func creatList1 () -> ListNode? {
    let node1: ListNode? = ListNode.init(1)
    let node2: ListNode? = ListNode.init(2)
    let node4: ListNode? = ListNode.init(4)
    node1?.next = node2
    node2?.next = node4
    return node1
}
//创建链表2  1->3->4  返回链表的头节点
func creatList2 () -> ListNode? {
    let node1: ListNode? = ListNode.init(1)
    let node3: ListNode? = ListNode.init(3)
    let node4: ListNode? = ListNode.init(4)
    node1?.next = node3
    node3?.next = node4
    return node1
}

/*
 思路1. 迭代、逐一比较 时间复杂度O(n) 空间复杂度S(1)(基本可忽略)  n:链表总个数
 */
/*
 ///  返回合并后的新链表头结点
 /// - Parameters:
 ///   - node1: 链表1 头结点
 ///   - node2:  链表2 头结点
 func mergeTwoLists(_ node1:inout ListNode?, _ node2:inout ListNode?) -> ListNode? {
 //头结点
 var headNode: ListNode?
 if (node1?.val ?? 0) <= (node2?.val ?? 0 ) {
 headNode = ListNode.init(node1!.val)   //S(1)
 headNode?.next = node1?.next
 }else {
 headNode = ListNode.init(node2!.val)  //S(1)
 headNode?.next = node2?.next
 }
 
 //当前节点
 var currentNode: ListNode? = headNode
 //循环
 while node1 != nil && node2 != nil {
 if node1!.val <= node2!.val {
 // 重新指定链表1 的头结点
 node1 = node1?.next;
 //先改变当前节点的next节点
 currentNode?.next = node2
 //更新重置当前新的链表节点
 currentNode = node2
 }else {
 // 重新指定链表2 的头结点
 node2 = node2?.next;
 //先改变当前节点的next节点
 currentNode?.next = node1
 //更新重置当前新的链表节点
 currentNode = currentNode?.next
 }
 }
 return headNode
 }
 */

/*
 思路2. 递归  时间复杂度O(n)
 */
func mergeTwoLists(_ node1:inout ListNode?, _ node2:inout ListNode?) -> ListNode? {
    if node1 == nil { return node2 }
    if node2 == nil { return node1 }
    if (node1?.val ?? 0) <= (node2?.val ?? 0 ) {
        var newNode1 = node1?.next
        var newNode2 = node2
        node1?.next =  mergeTwoLists(&newNode1, &newNode2)
        return node1
    }else {
        var newNode1 = node1
        var newNode2 = node2?.next
        node2?.next =  mergeTwoLists(&newNode1, &newNode2)
        return node2
    }
}

//输入链表1和2
var headNode1: ListNode? = creatList1()
var headNode2: ListNode? = creatList2()

//输出新链表
var newHeadNode: ListNode? = mergeTwoLists(&headNode1, &headNode2)
var string: String = "\(newHeadNode!.val)"
var currentNode : ListNode? = newHeadNode?.next
while currentNode != nil {
    string.append("->\(currentNode!.val)")
    currentNode = currentNode?.next
}

print("合并后的链表：\(string)")

//print(newHeadNode?.val as Any)
//print(newHeadNode?.next?.val as Any)
//print(newHeadNode?.next?.next?.val as Any)
//print(newHeadNode?.next?.next?.next?.val as Any)
//print(newHeadNode?.next?.next?.next?.next?.val as Any)
//print(newHeadNode?.next?.next?.next?.next?.next?.val as Any)
//print(newHeadNode?.next?.next?.next?.next?.next?.next?.val as Any)
