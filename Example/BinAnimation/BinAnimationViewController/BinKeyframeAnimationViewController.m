//
//  BinKeyframeAnimationViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/10/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinKeyframeAnimationViewController.h"
#import "BinExamplePublic.h"

@interface BinKeyframeAnimationViewController ()

@end

@implementation BinKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.animationArr = @[@"translation", @"scale", @"rotation", @"combination(translation+rotation)", ];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSUInteger index = [self.animationArr indexOfObject:animationStr];
    switch (index) {
        case 0:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 1:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 2:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.rotationZ(M_PI).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 3:
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).scaleXYZ(0.2, 0.2, 1.0).rotationZ(M_PI).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
