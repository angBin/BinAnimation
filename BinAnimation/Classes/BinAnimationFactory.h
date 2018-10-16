//
//  BinAnimationFactory.h
//  BinAnimation
//
//  Created by angBin on 2018/9/17.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationPublic.h"

FOUNDATION_EXTERN NSString *const BinAnimation;

@interface BinAnimationFactory : NSObject

- (BinAnimationFactory *(^)(CFTimeInterval second))beginTime;

- (BinAnimationFactory *(^)(CFTimeInterval second))duration;

- (BinAnimationFactory *(^)(float scale))speed;

- (BinAnimationFactory *(^)(CFTimeInterval second))timeOffset;

- (BinAnimationFactory *(^)(float time))repeatCount;

- (BinAnimationFactory *(^)(CFTimeInterval second))repeatDuration;

- (BinAnimationFactory *(^)(BOOL autoreverses))autoreverses;

- (BinAnimationFactory *(^)(NSString *fillMode))fillMode;

- (BinAnimationFactory *(^)(NSString *timingFunction))timingFunction;

- (BinAnimationFactory *(^)(BOOL removedOnCompletion))removedOnCompletion;

@end
