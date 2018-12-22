//
//  BinAnimation_CompletionBlockViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimation_CompletionBlockViewController.h"
#import "BinExamplePublic.h"

@interface BinAnimation_CompletionBlockViewController ()

@end

@implementation BinAnimation_CompletionBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.animationArr = @[@"without completion block", @"with completion block", ];
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
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
            } completion:^(BinAnimationInfo *animationInfo) {
                [self changeColor];
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
