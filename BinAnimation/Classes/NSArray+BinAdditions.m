//
//  NSArray+BinAdditions.m
//  BinAnimation
//
//  Created by angBin on 2018/10/9.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "NSArray+BinAdditions.h"
#import "CALayer+BinAdditions.h"
#import "BinAnimationFounder.h"

@implementation NSArray (BinAdditions)

- (NSArray *)bin_addOneAnimation_sync:(void (^)(BinAnimationFounder *))animationSetting {
    return [self bin_addOneAnimation_sync:animationSetting completion:nil];
}

- (NSArray <NSDictionary *>*)bin_addSameAnimation_sync:(void (^)(BinAnimationFounder *))animationSetting {
    return [self bin_addSameAnimation_sync:animationSetting completion:nil];
}

- (NSArray *)bin_addOneAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *))completion {
    SEL sel = NSSelectorFromString(CALayerBinAdditionsBinAddAnimationSync);
    IMP imp = [self.firstObject methodForSelector:sel];
    id (*fun)(id, SEL, void (^)(BinAnimationFounder *), void (^)(BinAnimationInfo *), NSArray *) = (void *)imp;
    return fun(self.firstObject, sel, animationSetting, completion, self);
}

- (NSArray <NSDictionary *>*)bin_addSameAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *))completion {
    NSMutableArray *layerAnimationArr = [NSMutableArray array];
    for (CALayer *layer in self) {
        NSArray *animationArr = [layer bin_addAnimation_sync:animationSetting completion:completion];
        NSDictionary *layerAnimationDic = @{
                                            @"layer" : layer,
                                            @"animationArray" : (animationArr ?: @[]),
                                            };
        [layerAnimationArr addObject:layerAnimationDic];
    }
    return (layerAnimationArr.count ? layerAnimationArr : nil);
}

- (void)bin_addOneAnimation_async:(void (^)(BinAnimationFounder *))animationSetting {
    [self bin_addOneAnimation_async:animationSetting completion:nil];
}

- (void)bin_addSameAnimation_async:(void (^)(BinAnimationFounder *))animationSetting {
    [self bin_addSameAnimation_async:animationSetting completion:nil];
}

- (void)bin_addOneAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *))completion {
    SEL sel = NSSelectorFromString(CALayerBinAdditionsBinAddAnimationAsync);
    IMP imp = [self.firstObject methodForSelector:sel];
    id (*fun)(id, SEL, void (^)(BinAnimationFounder *), void (^)(BinAnimationInfo *), NSArray *) = (void *)imp;
    fun(self.firstObject, sel, animationSetting, completion, self);
}

- (void)bin_addSameAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *))completion {
    for (CALayer *layer in self) {
        [layer bin_addAnimation_async:animationSetting completion:completion];
    }
}

- (void)bin_pause {
    for (CALayer *layer in self) {
        [layer bin_pause];
    }
}

- (void)bin_resume {
    for (CALayer *layer in self) {
        [layer bin_resume];
    }
}

@end
