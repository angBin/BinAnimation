//
//  BinTransitionAnimationViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/10/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinTransitionAnimationViewController.h"
#import "BinExamplePublic.h"

@interface BinTransitionAnimationViewController ()

@end

@implementation BinTransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.animationArr = @[@"fade", @"moveIn", @"push", @"reveal", ];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSUInteger index = [self.animationArr indexOfObject:animationStr];
    switch (index) {
        case 0:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                [self changeColor];
                founder.transition.type(kCATransitionFade).subtype(kCATransitionFromRight);
            }];
        }
            break;
        case 1:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                [self changeColor];
                founder.transition.type(kCATransitionMoveIn).subtype(kCATransitionFromRight);
            }];
        }
            break;
        case 2:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                [self changeColor];
                founder.transition.type(kCATransitionPush).subtype(kCATransitionFromRight);
            }];
        }
            break;
        case 3:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                [self changeColor];
                founder.transition.type(kCATransitionReveal).subtype(kCATransitionFromRight);
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
