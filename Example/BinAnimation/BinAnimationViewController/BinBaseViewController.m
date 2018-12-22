//
//  BinBaseViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/17.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinBaseViewController.h"
#import "BinExamplePublic.h"

@interface BinBaseViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation BinBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = bin_bgColor();
    
    [self.view addSubview:self.animationlabel];
    
    [self.view addSubview:self.animationTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animationArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.animationArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self tableViewDidClick:self.animationArr[indexPath.row]];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    self.animationlabel.text = [animationStr stringByAppendingString:@" is not running!"];
}

- (void)changeColor {
    if ([self.animationlabel.backgroundColor isEqual:bin_tintColor1()]) {
        self.animationlabel.backgroundColor = bin_tintColor2();
    } else {
        self.animationlabel.backgroundColor = bin_tintColor1();
    }
}

- (UILabel *)animationlabel {
    if (!_animationlabel) {
        _animationlabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5*(bin_screenWidth()-100), 10, 100, 100)];
        _animationlabel.backgroundColor = bin_tintColor1();
        _animationlabel.textAlignment = NSTextAlignmentCenter;
    }
    return _animationlabel;
}

- (UITableView *)animationTableView {
    if (!_animationTableView) {
        _animationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, bin_screenWidth(), bin_screenWidth(), bin_heightExceptNavBar()-bin_screenWidth()) style:UITableViewStylePlain];
        _animationTableView.delegate = self;
        _animationTableView.dataSource = self;
        _animationTableView.tableFooterView = [[UIView alloc] init];
    }
    return _animationTableView;
}

@end
