//
//  BinTransitionAnimationViewController.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/10/19.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinTransitionAnimationViewController.h"
#import "BinAnimation.h"

@interface BinTransitionAnimationViewController ()

@property (nonatomic, strong) UILabel *animationlabel;

@end

@implementation BinTransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.animationlabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5 * screenWidth, 100, 100, 100)];
    self.animationlabel.textAlignment = NSTextAlignmentCenter;
    self.animationlabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animationlabel];
    
    NSArray *animationArr = @[@"fade", @"moveIn", @"push", @"reveal", ];
    for (uint8_t i = 0; i < animationArr.count; i++) {
        UIButton *animationBut = [[UIButton alloc] init];
        animationBut.tag = 100 + i;
        animationBut.layer.borderWidth = 1.0;
        animationBut.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [animationBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [animationBut setTitle:animationArr[i] forState:UIControlStateNormal];
        [animationBut addTarget:self action:@selector(animationBut:) forControlEvents:UIControlEventTouchUpInside];
        [animationBut sizeToFit];
        animationBut.frame = CGRectMake(20, 100 + 60 * i, animationBut.frame.size.width + 20, 40);
        [self.view addSubview:animationBut];
    }
}

- (void)animationBut:(UIButton *)button {
    self.animationlabel.text = @"start";
    switch (button.tag) {
        case 100:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                self.animationlabel.backgroundColor = [UIColor yellowColor];
                founder.transition.type(kCATransitionFade).subtype(kCATransitionFromRight);
            }];
        }
            break;
        case 101:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                self.animationlabel.backgroundColor = [UIColor yellowColor];
                founder.transition.type(kCATransitionMoveIn).subtype(kCATransitionFromRight);
            }];
        }
            break;
        case 102:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                self.animationlabel.backgroundColor = [UIColor yellowColor];
                founder.transition.type(kCATransitionPush).subtype(kCATransitionFromRight);
            }];
        }
            break;
        case 103:
        {
            [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
                self.animationlabel.backgroundColor = [UIColor yellowColor];
                founder.transition.type(kCATransitionReveal).subtype(kCATransitionFromRight);
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
