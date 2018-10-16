//
//  BinKeyframeAnimationFactory.h
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationFactory.h"

FOUNDATION_EXTERN NSString *const BinKeyframeAnimation;
FOUNDATION_EXTERN NSString *const BinKeyframeAnimationLayer;
FOUNDATION_EXTERN NSString *const BinKeyframeAnimationGetKeyframeAnimationFirstValue;

@interface BinKeyframeAnimationFactory : BinAnimationFactory

- (BinKeyframeAnimationFactory *(^)(CGPathRef path))path;

- (BinKeyframeAnimationFactory *(^)(NSString *calculationModeName))calculationMode;

- (BinKeyframeAnimationFactory *(^)(NSArray <NSNumber *>*tensionValues))tensionValues;

- (BinKeyframeAnimationFactory *(^)(NSArray <NSNumber *>*continuityValues))continuityValues;

- (BinKeyframeAnimationFactory *(^)(NSArray <NSNumber *>*biasValues))biasValues;

- (BinKeyframeAnimationFactory *(^)(NSString *rotationModeName))rotationMode;

@end
