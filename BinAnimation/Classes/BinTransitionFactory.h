//
//  BinTransitionFactory.h
//  BinAnimation
//
//  Created by angBin on 2018/9/25.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationFactory.h"

FOUNDATION_EXTERN NSString *const BinTransition;

@interface BinTransitionFactory : BinAnimationFactory

- (BinTransitionFactory *(^)(NSString *type))type;

- (BinTransitionFactory *(^)(NSString *subtype))subtype;

- (BinTransitionFactory *(^)(float startProgress))startProgress;

- (BinTransitionFactory *(^)(float endProgress))endProgress;

@end
