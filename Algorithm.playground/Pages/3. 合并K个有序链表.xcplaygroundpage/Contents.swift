
/*
 3. 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

 示例:
 输入:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 输出: 1->1->2->3->4->4->5->6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
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
//创建链表1  1->4->5 返回链表的头节点
func creatList1 () -> ListNode? {
    let node1: ListNode? = ListNode.init(1)
    let node4: ListNode? = ListNode.init(4)
    let node5: ListNode? = ListNode.init(5)
    node1?.next = node4
    node4?.next = node5
    return node1
}
//创建链表2  1->3->4 返回链表的头节点
func creatList2 () -> ListNode? {
    let node1: ListNode? = ListNode.init(1)
    let node3: ListNode? = ListNode.init(3)
    let node4: ListNode? = ListNode.init(4)
    node1?.next = node3
    node3?.next = node4
    return node1
}
//创建链表3  2->6 返回链表的头节点
func creatList3 () -> ListNode? {
    let node2: ListNode? = ListNode.init(2)
    let node6: ListNode? = ListNode.init(6)
    node2?.next = node6
    return node2
}

//思路1 - 最笨的方法   时间复杂度O(nlogn)  空间复杂度S(n)  n：链表总节点数
func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }
    var nodesArray: [ListNode] = []
    //取出每条链表的节点合并到一个数组里面  O(n)
    for var node in lists {
        while node != nil {
            nodesArray.append(node!)   //S(n)
            node = node?.next
        }
    }
    //把数组里面的节点重新排序  O(nlogn)
    nodesArray.sort { (node1, node2) -> Bool in
        return node1.val < node2.val
    }
    
    // 初始化一个虚拟头节点
    let headNode = ListNode.init(0);
    var currentNode = headNode;
    //更新每个节点的nex  O(n)
    for node in nodesArray {
        currentNode.next = node
        currentNode = node
    }
    return headNode.next
}

//思路2 - 逐一比较  时间复杂度O(kn) k:链表个数 n:链表节点总个数
func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }
    
    
    
    
    return nil
}


//思路3 -
func mergeKLists3(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }
    
    
    
    
    return nil
}

//思路4 -
func mergeKLists4(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }
    
    
    
    
    return nil
}

//思路5 - 分治法(最优解推荐) 时间复杂度O(n*logk)
func mergeKLists5(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }
    return nil
}


//输入链表1/2/3
var headNode1: ListNode? = creatList1()
var headNode2: ListNode? = creatList2()
var headNode3: ListNode? = creatList3()

//输出新链表
var newHeadNode: ListNode? = mergeKLists1([headNode1, headNode2, headNode3])
var string: String = "\(newHeadNode!.val)"
var nextNode : ListNode? = newHeadNode?.next
while nextNode != nil {
    string.append("->\(nextNode!.val)")
    nextNode = nextNode?.next
}

print("合并后的链表：\(string)")

