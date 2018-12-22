//
//  BinKeyframeAnimation_FromOrToOrByViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/21.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinKeyframeAnimation_FromOrToOrByViewController.h"
#include "BinExamplePublic.h"

@interface BinKeyframeAnimation_FromOrToOrByViewController ()

@end

@implementation BinKeyframeAnimation_FromOrToOrByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect animationlabelFrame = self.animationlabel.frame;
    animationlabelFrame.origin.x -= 100;
    self.animationlabel.frame = animationlabelFrame;
    self.animationArr = @[@"fromKeyframe", @"toKeyframe", @"byKeyframe", ];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSUInteger index = [self.animationArr indexOfObject:animationStr];
    switch (index) {
        case 0:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.fromKeyframe.translationY(100);
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
                founder.toKeyframe.translationX(200).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 1:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
                founder.toKeyframe.translationX(200).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 2:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
                founder.byKeyframe.translationX(200).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
