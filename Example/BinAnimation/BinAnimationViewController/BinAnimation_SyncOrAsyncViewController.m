//
//  BinAnimation_SyncOrAsyncViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimation_SyncOrAsyncViewController.h"
#import "BinExamplePublic.h"

@interface BinAnimation_SyncOrAsyncViewController ()

@property (nonatomic, strong) NSMutableArray *layerArr;

@end

@implementation BinAnimation_SyncOrAsyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.animationlabel removeFromSuperview];
    self.animationlabel = nil;
    self.animationArr = @[@"sync(have to wait for a while)", @"async", ];
    
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
        {
            NSArray *animationArr = [self.layerArr bin_addSameAnimation_sync:^(BinAnimationFounder *founder) {
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            NSLog(@"AnimationArray: %@", animationArr); // [{@"layer" : layer, @"animationArray" : animationArr}, ...]
        }
            break;
        case 1:
            [self.layerArr bin_addSameAnimation_async:^(BinAnimationFounder *founder) {
                founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
            }];
            break;
            
        default:
            break;
    }
}

@end
