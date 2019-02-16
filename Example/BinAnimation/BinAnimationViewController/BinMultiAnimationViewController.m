//
//  BinMultiAnimationViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2019/2/16.
//  Copyright © 2019 angBin. All rights reserved.
//

#import "BinMultiAnimationViewController.h"
#import "BinExamplePublic.h"

@interface BinMultiAnimationViewController ()

@end

@implementation BinMultiAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.animationArr = @[@"spring+keyframe(rotation)", @"keyframe(translation)+keyframe(opacity)", ];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSUInteger index = [self.animationArr indexOfObject:animationStr];
    switch (index) {
        case 0:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.springAnimation.mass(1).stiffness(50).damping(2).initialVelocity(10).byValue([NSValue valueWithCGSize:CGSizeMake(0, 200)]);
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 1:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
                [founder keyframeAnimation]; // 多组 keyframeAnimation 之间需要使用 [founder keyframeAnimation] 隔离
                founder.toKeyframe.opacity(0.0).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
