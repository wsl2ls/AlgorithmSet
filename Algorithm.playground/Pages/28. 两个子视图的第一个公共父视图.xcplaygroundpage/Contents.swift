/*
 28. 两个子视图的第一个公共父视图
 
 用数组模拟两个子视图的所有父视图
 输入  superViews1: [6, 5, 4, 3, 2, 1]
 superViews2: [11, 10, 9, 8, 7, 3, 2, 1]
 输出  3
 
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

print(firstPublicSuperView(superViews1, superViews2))
