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

void add(id self, SEL _cmd) {
    NSLog(@"add ");
}
// 作用:去解决没有实现方法,动态添加方法
+(BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(add)) {
        // 添加方法
        class_addMethod(self, sel, (IMP)add,"v@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
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
