//
//  BinSpringAnimationFactory.m
//  BinAnimation
//
//  Created by angBin on 2018/9/25.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinSpringAnimationFactory.h"

NSString *const BinSpringAnimation = @"springAnimation";

@interface BinSpringAnimationFactory ()

/**
 The property name must be BinSpringAnimation's value.
 */
@property (nonatomic, weak) CASpringAnimation *springAnimation;

@end

@implementation BinSpringAnimationFactory

- (BinSpringAnimationFactory *(^)(float))mass {
    return ^id(float mass) {
        _springAnimation.mass = mass;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(float))stiffness {
    return ^id(float stiffness) {
        _springAnimation.stiffness = stiffness;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(float))damping {
    return ^id(float damping) {
        _springAnimation.damping = damping;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(float))initialVelocity {
    return ^id(float initialVelocity) {
        _springAnimation.initialVelocity = initialVelocity;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(float *))getSettlingDuration {
    return ^id(float *settlingDuration) {
        *settlingDuration = _springAnimation.settlingDuration;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(id))fromValue {
    return ^id(id value) {
        _springAnimation.fromValue = value;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(id))toValue {
    return ^id(id value) {
        _springAnimation.toValue = value;
        return self;
    };
}

- (BinSpringAnimationFactory *(^)(id))byValue {
    return ^id(id value) {
        _springAnimation.byValue = value;
        return self;
    };
}

- (void)setSpringAnimation:(CASpringAnimation *)springAnimation {
    _springAnimation = springAnimation;
    [self setValue:springAnimation forKey:BinAnimation];
}

- (void)dealloc {
    if (!_springAnimation.duration) {
        _springAnimation.duration = _springAnimation.settlingDuration;
    };
    if (!_springAnimation.keyPath) {
        _springAnimation.keyPath = @"position";
    }
}

@end
