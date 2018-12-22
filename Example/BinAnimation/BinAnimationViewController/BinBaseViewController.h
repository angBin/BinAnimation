//
//  BinBaseViewController.h
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/17.
//  Copyright © 2018 angBin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinBaseViewController : UIViewController

@property (nonatomic, strong, nullable) UILabel *animationlabel;
@property (nonatomic, strong) UITableView *animationTableView;
@property (nonatomic, strong) NSArray *animationArr;

- (void)changeColor;

@end

NS_ASSUME_NONNULL_END
