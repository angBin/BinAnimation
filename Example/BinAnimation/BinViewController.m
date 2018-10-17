//
//  BinViewController.m
//  BinAnimation
//
//  Created by angBin on 10/16/2018.
//  Copyright (c) 2018 angBin. All rights reserved.
//

#import "BinViewController.h"
#import "BinAnimation.h"

@interface BinViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation BinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.testView.center = self.view.center;
    self.testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.testView.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        founder.toKeyframe.scaleX(0.5).scaleY(0.5).keyTime(0.5).autoreverses(YES).repeatCount(CGFLOAT_MAX);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
