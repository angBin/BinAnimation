//
//  BinAnimationFounder.h
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinAnimationPublic.h"

@class BinKeyframeAnimationFactory;
@class BinSpringAnimationFactory;
@class BinTransitionFactory;
@class BinAnimationGroupFactory;
@class BinKeyframeFactory;

@interface BinAnimationFounder : NSObject

- (instancetype)initWithLayer:(NSArray *)layerArr;

- (NSArray *)build;

- (BinKeyframeFactory *)fromKeyframe;

- (BinKeyframeFactory *)toKeyframe;

- (BinKeyframeFactory *)byKeyframe;

- (BinKeyframeAnimationFactory *)keyframeAnimation;

- (BinKeyframeAnimationFactory *(^)(NSString *keyPath))moreKeyframeAnimation;

- (BinSpringAnimationFactory *)springAnimation;

- (BinSpringAnimationFactory *(^)(NSString *keyPath))moreSpringAnimation API_AVAILABLE(ios(9.0));

- (BinTransitionFactory *)transition;

- (BinAnimationGroupFactory *)animationGroup;

- (void (^)(NSMutableArray *animationArr))getAnimationArr;

@end
