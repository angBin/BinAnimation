//
//  CALayer+BinAdditions.m
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "CALayer+BinAdditions.h"
#import "BinAnimationFounder.h"
#import <objc/runtime.h>

const static char animation2DArrChar;

NSString *const CALayerBinAdditionsBinAddAnimationSync = @"bin_addAnimation_sync:completion:layerArr:";
NSString *const CALayerBinAdditionsBinAddAnimationAsync = @"bin_addAnimation_async:completion:layerArr:";

@implementation BinAnimationInfo

@end

@interface CALayer() <CAAnimationDelegate>

@end

@implementation CALayer (BinAdditions)

- (NSArray *)bin_addAnimation_sync:(void (^)(BinAnimationFounder *))animationSetting {
    return [self bin_addAnimation_sync:animationSetting completion:nil];
}

- (NSArray *)bin_addAnimation_sync:(void (^)(BinAnimationFounder *))animationSetting completion:(void (^)(BinAnimationInfo *))completion {
    return [self bin_addAnimation_sync:animationSetting completion:completion layerArr:@[self]];
}

- (void)bin_addAnimation_async:(void (^)(BinAnimationFounder *))animationSetting {
    [self bin_addAnimation_async:animationSetting completion:nil];
}

- (void)bin_addAnimation_async:(void (^)(BinAnimationFounder *))animationSetting completion:(void (^)(BinAnimationInfo *))completion {
    [self bin_addAnimation_async:animationSetting completion:completion layerArr:@[self]];
}

- (void)bin_pause {
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

- (void)bin_resume {
    CFTimeInterval pausedTime = self.timeOffset;
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval sincePauseTime = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.beginTime = sincePauseTime;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSMutableArray *animation2DArr = objc_getAssociatedObject(self, &animation2DArrChar);
    for (NSMutableArray *animationArr in animation2DArr) {
        for (CAAnimation *animation in animationArr) {
            if ([anim isEqual:animation]) {
                void (^fun)(BinAnimationInfo *) = animationArr.lastObject;
                BinAnimationInfo *animationInfo = [[BinAnimationInfo alloc] init];
                animationInfo.animation = anim;
                animationInfo.layer = self;
                animationInfo.finished = flag;
                animationInfo.index = [animationArr indexOfObject:animation] - 1;
                fun(animationInfo);
                NSUInteger unfinishedAnimationCount = ((NSNumber *)(animationArr.firstObject)).integerValue;
                if (!--unfinishedAnimationCount) {
                    [animation2DArr removeObject:animationArr];
                }
                [animationArr replaceObjectAtIndex:0 withObject:@(unfinishedAnimationCount)];
                return;
            }
        }
    }
}

/**
 The method name must be equal to the CALayerBinAdditionsBinAddAnimationSync's value.
 */
- (NSArray *)bin_addAnimation_sync:(void (^)(BinAnimationFounder *))animationSetting completion:(void (^)(BinAnimationInfo *))completion layerArr:(NSArray *)layerArr {
    BinAnimationFounder *animationFounder = [[BinAnimationFounder alloc] initWithLayer:layerArr];
    @autoreleasepool {
        animationSetting(animationFounder);
    }
    return [self addAnimationToLayerWithAnimationArr:[animationFounder build] completion:completion layerArr:layerArr];
}

/**
 The method name must be equal to the CALayerBinAdditionsBinAddAnimationAsync's value.
 */
- (void)bin_addAnimation_async:(void (^)(BinAnimationFounder *))animationSetting completion:(void (^)(BinAnimationInfo *))completion layerArr:(NSArray *)layerArr {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        BinAnimationFounder *animationFounder = [[BinAnimationFounder alloc] initWithLayer:layerArr];
        @autoreleasepool {
            animationSetting(animationFounder);
        }
        NSArray *animationArr = [animationFounder build];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addAnimationToLayerWithAnimationArr:animationArr completion:completion layerArr:layerArr];
        });
    });
}

- (NSArray *)addAnimationToLayerWithAnimationArr:(NSArray *)animationArr completion:(void (^)(BinAnimationInfo *))completion layerArr:(NSArray *)layerArr {
    NSUInteger binAnimationCount = 0;
    for (CALayer *layer in layerArr) {
        NSArray *previousAnimationKeyArr = [layer animationKeys];
        for (NSString *previousAnimationKey in previousAnimationKeyArr) {
            if ([previousAnimationKey containsString:@"_BinAnimation"]) {
                NSUInteger binAnimationNCountTemp = previousAnimationKey.integerValue;
                binAnimationCount = ((binAnimationCount > binAnimationNCountTemp) ? binAnimationCount : binAnimationNCountTemp);
            }
        }
    }
    if (completion) {
        for (CALayer *layer in layerArr) {
            NSMutableArray *layer_animationArr = [NSMutableArray array];
            for (CAAnimation *animation in animationArr) {
                animation.delegate = layer;
                NSString *animationKey = [NSString stringWithFormat:@"%ld_BinAnimation", ++binAnimationCount];
                [layer addAnimation:animation forKey:animationKey];
                [layer_animationArr addObject:[layer animationForKey:animationKey]];
            }
            [layer_animationArr insertObject:@(layer_animationArr.count) atIndex:0];
            [layer_animationArr addObject:completion];
            NSMutableArray *animation2DArr = objc_getAssociatedObject(layer, &animation2DArrChar);
            if (!animation2DArr) {
                animation2DArr = [NSMutableArray array];
                objc_setAssociatedObject(layer, &animation2DArrChar, animation2DArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            [animation2DArr addObject:layer_animationArr];
        }
    } else {
        for (CALayer *layer in layerArr) {
            for (CAAnimation *animation in animationArr) {
                [layer addAnimation:animation forKey:[NSString stringWithFormat:@"%ld_BinAnimation", ++binAnimationCount]];
            }
        }
    }
    return animationArr;
}

@end
