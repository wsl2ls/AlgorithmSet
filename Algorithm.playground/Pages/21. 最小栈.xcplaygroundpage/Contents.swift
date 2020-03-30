/*
 21. 最小栈
 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
 
 push(x) -- 将元素 x 推入栈中。
 pop() -- 删除栈顶的元素。
 top() -- 获取栈顶元素。
 getMin() -- 检索栈中的最小元素。
 
 示例:
 
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-stack
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 需要额外辅助空间
 */
class MinStack1 {
    
    private var values: [Int] = []
    private var minValues: [Int] = []
    
    init() {}
    func push(_ x: Int) {
        values.append(x)
        let minValue = minValues.last
        if minValue == nil || x <= minValue! {
            minValues.append(x)
        }
    }
    func pop() {
        let minValue = minValues.last!
        let x = values.removeLast()
        
        if x == minValue {
            minValues.removeLast()
        }
    }
    func top() -> Int {
        return values.last!
    }
    
    func getMin() -> Int {
        return minValues.last!
    }
}


/*
 不需要额外的辅助空间，用元组存储每一层的值和当前层的最小值
 */
class MinStack2 {
    
    typealias Item = (value: Int, prevMin: Int)
    private var items: [Item] = []
    
    init() {}
    func push(_ x: Int) {
        if let lastItem = items.last {
            items.append((value: x, prevMin: min(x, lastItem.prevMin)))
        } else {
            items.append((value: x, prevMin: x))
        }
    }
    func pop() {
        items.removeLast()
    }
    func top() -> Int {
        return items.last!.value
    }
    func getMin() -> Int {
        return items.last!.prevMin
    }
}


let minStack: MinStack2 = MinStack2();
minStack.push(-4);
minStack.push(0);
minStack.push(-3);
minStack.push(1);
minStack.push(0)
minStack.getMin();
