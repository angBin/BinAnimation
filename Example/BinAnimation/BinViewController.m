//
//  BinViewController.m
//  BinAnimation
//
//  Created by angBin on 10/16/2018.
//  Copyright (c) 2018 angBin. All rights reserved.
//

#import "BinViewController.h"
#import "BinExamplePublic.h"

@interface BinViewController ()

@end

@implementation BinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 避免viewC被navC的导航栏遮挡，以下两种方法都可以实现，但是已经在AppDelegate中使用了方法二，所以此处不再重复
//    self.edgesForExtendedLayout = NO;
//    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"BinAnimationExample";
    
    [self.animationlabel removeFromSuperview];
    self.animationlabel = nil;
    CGRect animationTableViewFrame = self.animationTableView.frame;
    animationTableViewFrame.origin.y = 0;
    animationTableViewFrame.size.height = bin_heightExceptNavBar();
    self.animationTableView.frame = animationTableViewFrame;
    self.animationArr = @[@"KeyframeAnimation", @"SpringAnimation", @"TransitionAnimation", @"AnimationGroup", @"Animation_PauseAndResume", @"Animation_CompletionBlock", @"Animation_SyncOrAsync", @"Animation_OneOrSome", @"KeyframeAnimation_FromOrToOrBy", ];
}

- (void)tableViewDidClick:(NSString *)animationStr {
    NSString *animationViewControllerString = [NSString stringWithFormat:@"Bin%@ViewController", animationStr];
    UIViewController *animationViewController = [[NSClassFromString(animationViewControllerString) alloc] init];
    [self.navigationController pushViewController:animationViewController animated:YES];
}

@end
