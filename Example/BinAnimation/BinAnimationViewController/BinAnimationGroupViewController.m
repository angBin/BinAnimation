//
//  BinAnimationGroupViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/10/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimationGroupViewController.h"
#import "BinExamplePublic.h"

@interface BinAnimationGroupViewController ()

@end

@implementation BinAnimationGroupViewController

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
                [founder keyframeAnimation];
                founder.toKeyframe.opacity(0.0).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
