//
//  BinTransitionFactory.m
//  BinAnimation
//
//  Created by angBin on 2018/9/25.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinTransitionFactory.h"

NSString *const BinTransition = @"transition";

@interface BinTransitionFactory ()

/**
 The property name must be BinTransition's value.
 */
@property (nonatomic, weak) CATransition *transition;

@end

@implementation BinTransitionFactory

- (BinTransitionFactory *(^)(NSString *))type {
    return ^id(NSString *type) {
        _transition.type = type;
        return self;
    };
}

- (BinTransitionFactory *(^)(NSString *))subtype {
    return ^id(NSString *subtype) {
        _transition.subtype = subtype;
        return self;
    };
}

- (BinTransitionFactory *(^)(float))startProgress {
    return ^id(float startProgress) {
        _transition.startProgress = startProgress;
        return self;
    };
}

- (BinTransitionFactory *(^)(float))endProgress {
    return ^id(float endProgress) {
        _transition.endProgress = endProgress;
        return self;
    };
}

- (void)setTransition:(CATransition *)transition {
    _transition = transition;
    [self setValue:transition forKey:BinAnimation];
}

@end
