//
//  BinAnimation_OneOrSomeViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/21.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimation_OneOrSomeViewController.h"
#include "BinExamplePublic.h"

@interface BinAnimation_OneOrSomeViewController ()

@property (nonatomic, strong) NSMutableArray *layerArr;

@end

@implementation BinAnimation_OneOrSomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.animationlabel removeFromSuperview];
    self.animationlabel = nil;
    self.animationArr = @[@"one animation", @"same animations(have to wait for a while)", ];
    
    self.layerArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 324; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(12.5+20*(i%18), 12.5+20*(i/18), 10, 10)];
        view.backgroundColor = bin_tintColor1();
        [self.view addSubview:view];
        [self.layerArr addObject:view.layer];
    }
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSUInteger index = [self.animationArr indexOfObject:animationStr];
    switch (index) {
        case 0:
            [self.layerArr bin_addOneAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
        case 1:
            [self.layerArr bin_addSameAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
