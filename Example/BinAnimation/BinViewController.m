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

@end

@implementation BinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSArray *animationArr = @[@"SpringAnimation", @"KeyframeAnimation", @"TransitionAnimation", @"AnimationGroup", ];
    for (uint8_t i = 0; i < animationArr.count; i++) {
        UIButton *animationBut = [[UIButton alloc] initWithFrame:CGRectMake(25, 100 + 70 * i, screenWidth - 50, 50)];
        animationBut.layer.borderWidth = 1.0;
        animationBut.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [animationBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [animationBut setTitle:animationArr[i] forState:UIControlStateNormal];
        [animationBut addTarget:self action:@selector(animationBut:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:animationBut];
    }
}

- (void)animationBut:(UIButton *)button {
    NSString *animationViewControllerString = [NSString stringWithFormat:@"Bin%@ViewController", button.titleLabel.text];
    UIViewController *animationViewController = [[NSClassFromString(animationViewControllerString) alloc] init];
    [self.navigationController pushViewController:animationViewController animated:YES];
}

@end
