//
//  NSArray+BinAdditions.h
//  BinAnimation
//
//  Created by angBin on 2018/10/9.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinAnimationPublic.h"

@class BinAnimationInfo;
@class BinAnimationFounder;

@interface NSArray (BinAdditions)

- (NSArray *)bin_addOneAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting;

- (NSArray <NSDictionary *>*)bin_addSameAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting;

- (NSArray *)bin_addOneAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *animationInfo))completion;

- (NSArray <NSDictionary *>*)bin_addSameAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *animationInfo))completion;

- (void)bin_addOneAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting;

- (void)bin_addSameAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting;

- (void)bin_addOneAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *animationInfo))completion;

- (void)bin_addSameAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *animationInfo))completion;

- (void)bin_pause;

- (void)bin_resume;

@end
