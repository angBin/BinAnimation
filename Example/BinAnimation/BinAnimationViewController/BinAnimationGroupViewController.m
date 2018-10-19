//
//  BinAnimationGroupViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/10/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimationGroupViewController.h"
#import "BinAnimation.h"

@interface BinAnimationGroupViewController ()

@property (nonatomic, strong) UILabel *animationlabel;

@end

@implementation BinAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.animationlabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5 * screenWidth, 100, 100, 100)];
    self.animationlabel.textAlignment = NSTextAlignmentCenter;
    self.animationlabel.layer.masksToBounds = YES;
    self.animationlabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animationlabel];
    
    NSArray *animationArr = @[@"spring+keyframe", @"keyframe+keyframe", ];
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
                founder.springAnimation.mass(1).stiffness(50).damping(2).initialVelocity(10).byValue([NSValue valueWithCGSize:CGSizeMake(0, 200)]);
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 101:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.cornerRadius(50).keyTime(1.0).autoreverses(YES);
                [founder keyframeAnimation];
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
