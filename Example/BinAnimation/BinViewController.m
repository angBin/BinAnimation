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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(120, 250, 100, 100)];
    self.testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.testView.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        founder.toKeyframe.scaleX(0.5).scaleY(0.5).keyTime(1.0).autoreverses(YES).duration(CGFLOAT_MAX).removedOnCompletion(NO);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
