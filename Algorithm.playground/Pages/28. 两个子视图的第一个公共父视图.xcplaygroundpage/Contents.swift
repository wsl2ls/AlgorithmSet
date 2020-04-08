/*
 28. 两个子视图的第一个公共父视图
 
 用数组模拟两个子视图的所有父视图
 输入  superViews1: [6, 5, 4, 3, 2, 1]
      superViews2: [11, 10, 9, 8, 7, 3, 2, 1]
 输出:  3
*/

/*
 两个子视图的第一个公共父视图
 */
func firstPublicSuperView(_ views1: [Int] , _ views2: [Int]) -> Int {
    let minCount = min(views1.count, views2.count)
    var target = 0
    for i in (0..<minCount).reversed() {
        var view1 = views1[i]
        if views1.count > minCount {
            view1 = views1[i+views1.count-minCount]
        }
        var view2 = views2[i]
        if views2.count > minCount {
            view2 = views2[i+views2.count-minCount]
        }
        if view1 == view2 {
            target = view1
        }else {
            return target
        }
    }
    return 0
}
var superViews1 = [6, 5, 4, 3, 2, 1]
var superViews2 = [11, 10, 9, 8, 7, 3, 2, 1]
//print(firstPublicSuperView(superViews1, superViews2))

/*
 两个单链表的第一个公共节点
 
 List1:  5->4->3->2->1
 List2:  8->7->6->3->2->1
 输出第一个公共节点：  3
 
 注意：
 如果两个链表没有交点，返回 null.
 在返回结果后，两个链表仍须保持原有的结构。
 可假定整个链表结构中没有循环。
 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
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
 思路1：哈希表法
 时间复杂度O(m+n) 空间复杂度S(m)
 */
func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var dict = [Int:Bool]()
    //O(m)  S(m)
    var currNodeA = headA
    while currNodeA != nil {
        dict[currNodeA!.val] = true
        currNodeA = currNodeA?.next
    }
    //O(n)
    var currNodeB = headB
    while currNodeB != nil {
        if dict[currNodeB!.val] == true {
            return currNodeB
        }
        currNodeB = currNodeB?.next
    }
    return nil
}

/*
 思路2：双指针法  a+b = b+a
 * 创建两个指针 pA 和 pB，分别初始化为链表 A 和 B 的头结点。然后让它们向后逐结点遍历。
 * 当pA 到达链表的尾部时，将它重定位到链表 B 的头结点 (你没看错，就是链表 B); 类似的，当 pB 到达链表的尾部时，将它重定位到链表 A 的头结点。
 * 若在某一时刻 pA 和 pB 相遇，则 pA/pB 为相交结点。
  时间复杂度O(m+n) 空间复杂度S(1)
 */
func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var currNodeA = headA
    var currNodeB = headB
    while currNodeA != nil && currNodeB != nil {
        if currNodeA?.val == currNodeB?.val {
            return currNodeA
        }
        currNodeA = currNodeA?.next != nil ? currNodeA?.next : headB
        currNodeB = currNodeB?.next != nil ? currNodeB?.next : headA
    }
    return nil
}

var node = getIntersectionNode2(node5, node8)
print(node?.val)



