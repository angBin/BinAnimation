//
//  BinAnimation_PauseAndResumeViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimation_PauseAndResumeViewController.h"
#import "BinExamplePublic.h"

@interface BinAnimation_PauseAndResumeViewController ()

@end

@implementation BinAnimation_PauseAndResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.animationArr = @[@"pause", @"resume", ];
    
    [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        founder.toKeyframe.translationY(200).keyTime(1.0).repeatCount(100).autoreverses(YES);
    }];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSUInteger index = [self.animationArr indexOfObject:animationStr];
    switch (index) {
        case 0:
            [self.animationlabel.layer bin_pause];
            break;
        case 1:
            [self.animationlabel.layer bin_resume];
            break;
            
        default:
            break;
    }
}

@end
