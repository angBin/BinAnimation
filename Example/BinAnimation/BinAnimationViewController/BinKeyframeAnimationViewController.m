//
//  BinKeyframeAnimationViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/10/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinKeyframeAnimationViewController.h"
#import "BinAnimation.h"

@interface BinKeyframeAnimationViewController ()

@property (nonatomic, strong) UILabel *animationlabel;

@end

@implementation BinKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.animationlabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5 * screenWidth, 100, 100, 100)];
    self.animationlabel.textAlignment = NSTextAlignmentCenter;
    self.animationlabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animationlabel];
    
    NSArray *animationArr = @[@"translation", @"scale", @"rotation", @"combination", ];
    for (uint8_t i = 0; i < animationArr.count; i++) {
        UIButton *animationBut = [[UIButton alloc] init];
        animationBut.tag = 100 + i;
        animationBut.layer.borderWidth = 1.0;
        animationBut.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [animationBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [animationBut setTitle:animationArr[i] forState:UIControlStateNormal];
        [animationBut addTarget:self action:@selector(animationBut:) forControlEvents:UIControlEventTouchUpInside];
        [animationBut sizeToFit];
        animationBut.frame = CGRectMake(20, 100 + 60 * i, animationBut.frame.size.width + 20, 40);
        [self.view addSubview:animationBut];
    }
}

- (void)animationBut:(UIButton *)button {
    self.animationlabel.text = @"start";
    switch (button.tag) {
        case 100:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 101:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 102:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.rotationZ(M_PI).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 103:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).scaleXYZ(0.2, 0.2, 1.0).rotationZ(M_PI).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
