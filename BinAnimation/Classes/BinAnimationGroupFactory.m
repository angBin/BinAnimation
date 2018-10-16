
//
//  BinAnimationGroupFactory.m
//  BinAnimation
//
//  Created by angBin on 2018/9/15.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationGroupFactory.h"

NSString *const BinAnimationGroup = @"animationGroup";

@interface BinAnimationGroupFactory ()

/**
 The property name must be BinAnimationGroup's value.
 */
@property (nonatomic, weak) CAAnimationGroup *animationGroup;

@end

@implementation BinAnimationGroupFactory

- (void)setAnimationGroup:(CAAnimationGroup *)animationGroup {
    _animationGroup = animationGroup;
    [self setValue:animationGroup forKey:BinAnimation];
}

@end
