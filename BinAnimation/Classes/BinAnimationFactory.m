//
//  BinAnimationFactory.m
//  BinAnimation
//
//  Created by angBin on 2018/9/17.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationFactory.h"

NSString *const BinAnimation = @"animation";

@interface BinAnimationFactory ()

/**
 The property name must be BinAnimation's value.
 */
@property (nonatomic, weak) CAAnimation *animation;

@end

@implementation BinAnimationFactory

- (BinAnimationFactory *(^)(CFTimeInterval))beginTime {
    return ^id(CFTimeInterval second) {
        _animation.beginTime = second;
        return self;
    };
}

- (BinAnimationFactory *(^)(CFTimeInterval))duration {
    return ^id(CFTimeInterval second) {
        _animation.duration = second;
        return self;
    };
}

- (BinAnimationFactory *(^)(float))speed {
    return ^id(float scale) {
        _animation.speed = scale;
        return self;
    };
}

- (BinAnimationFactory *(^)(CFTimeInterval))timeOffset {
    return ^id(CFTimeInterval second) {
        _animation.timeOffset = second;
        return self;
    };
}

- (BinAnimationFactory *(^)(float))repeatCount {
    return ^id(float time) {
        _animation.repeatCount = time;
        return self;
    };
}

- (BinAnimationFactory *(^)(CFTimeInterval))repeatDuration {
    return ^id(CFTimeInterval second) {
        _animation.repeatDuration = second;
        return self;
    };
}

- (BinAnimationFactory *(^)(BOOL))autoreverses {
    return ^id(BOOL autoreverses) {
        _animation.autoreverses = autoreverses;
        return self;
    };
}

- (BinAnimationFactory *(^)(NSString *))fillMode {
    return ^id(NSString *fillMode) {
        _animation.fillMode = fillMode;
        return self;
    };
}

- (BinAnimationFactory *(^)(NSString *))timingFunction {
    return ^id(NSString *timingFunction) {
        _animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
        return self;
    };
}

- (BinAnimationFactory *(^)(BOOL))removedOnCompletion {
    return ^id(BOOL removedOnCompletion) {
        _animation.removedOnCompletion = removedOnCompletion;
        return self;
    };
}

@end
