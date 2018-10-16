//
//  BinSpringAnimationFactory.h
//  BinAnimation
//
//  Created by angBin on 2018/9/25.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationFactory.h"

FOUNDATION_EXTERN NSString *const BinSpringAnimation;

@interface BinSpringAnimationFactory : BinAnimationFactory

- (BinSpringAnimationFactory *(^)(float mass))mass;

- (BinSpringAnimationFactory *(^)(float stiffness))stiffness;

- (BinSpringAnimationFactory *(^)(float damping))damping;

- (BinSpringAnimationFactory *(^)(float initialVelocity))initialVelocity;

- (BinSpringAnimationFactory *(^)(float *settlingDuration))getSettlingDuration;

- (BinSpringAnimationFactory *(^)(id value))fromValue;

- (BinSpringAnimationFactory *(^)(id value))toValue;

- (BinSpringAnimationFactory *(^)(id value))byValue;

@end
