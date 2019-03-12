//
//  ViewController.m
//  AlgorithmSet
//
//  Created by 王双龙 on 2019/3/5.
//  Copyright © 2019年 https://www.jianshu.com/u/e15d1f644bea. All rights reserved.
//

#import "ViewController.h"
#import "SLTableViewCell.h"
#import <objc/message.h>

@interface ForwardingTarget : NSObject
- (void)add;
@end
@implementation ForwardingTarget
- (void)add {
    NSLog(@"add方法转发给ForwardingTarget执行");
}
@end

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationItem.title = @"算法练习";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStyleDone target:self action:@selector(add)];
    [self.tableView registerNib:[UINib nibWithNibName:@"SLTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    self.tableView.estimatedRowHeight = 88;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self getDataSource];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context{
    
}

#pragma mark - GetDataSource

- (void)getDataSource {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Question" ofType:@"plist"];
    NSArray * questions = [[NSArray alloc] initWithContentsOfFile:plistPath];
    [self.dataSource addObjectsFromArray:questions];
}

#pragma mark - Getter

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark - Event Handle


#pragma mark - 消息转发

// 默认方法都有两个隐式参数，
void add(id self, SEL _cmd) {
    NSLog(@"动态添加了add方法");
}
//  第一步，消息接收者没有找到对应的方法时候，会先调用此方法，可在此方法实现中动态添加新的方法
//  返回YES表示相应selector的实现已经被找到，或者添加新方法到了类中，否则返回NO
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(add)) {
        // 动态添加方法
            class_addMethod(self, sel, (IMP)add,"v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//  第二步， 如果第一步的返回NO或者直接返回了YES而没有添加方法，该方法被调用
//  在这个方法中，我们可以指定一个可以返回一个可以响应该方法的对象， 注意如果返回self就会死循环
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(add)) {
//        //消息转发给ForwardingTarget对象
//        if ([[ForwardingTarget new] respondsToSelector:@selector(add)]) {
//           return [ForwardingTarget new];
//        }
//    }
    return [super forwardingTargetForSelector:aSelector];
}

//  第三步， 如果forwardingTargetForSelector:返回了nil，则该方法会被调用，系统会询问我们要一个合法的『类型编码(Type Encoding)』
//  若返回 nil，则不会进入下一步，而是无法处理消息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if (aSelector == @selector(add)) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//    }
   return  [super methodSignatureForSelector:aSelector];
}

// 在这里进行消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    SEL sel = [anInvocation selector];
//    ForwardingTarget* forward = [ForwardingTarget new];
//    if ([forward respondsToSelector:sel]) {
//         //指定消息的接收者
//         [anInvocation invokeWithTarget:forward];
//    }else{
        [super forwardInvocation:anInvocation];
//    }
    
}

// 如果没有实现消息转发 forwardInvocation  则调用此方法
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"找不到方法：%@", NSStringFromSelector(aSelector));
}

#pragma mark - UITableViewDelegate  UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 44;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SLTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath] ;
    cell.questionLabel.text = [NSString stringWithFormat:@"%ld：  %@",indexPath.row, _dataSource[indexPath.row]];
    return cell;
}

- (void )tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
