//
//  CALayer+BinAdditions.h
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationPublic.h"

@class BinAnimationFounder;

FOUNDATION_EXTERN NSString *const CALayerBinAdditionsBinAddAnimationSync;
FOUNDATION_EXTERN NSString *const CALayerBinAdditionsBinAddAnimationAsync;

@interface BinAnimationInfo : NSObject

@property (nonatomic, weak) CAAnimation *animation;
@property (nonatomic, weak) CALayer *layer;
@property (nonatomic, assign) BOOL finished;
@property (nonatomic, assign) NSInteger index;

@end

@interface CALayer (BinAdditions)

- (NSArray *)bin_addAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting;

- (NSArray *)bin_addAnimation_sync:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *animationInfo))completion;

- (void)bin_addAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting;

- (void)bin_addAnimation_async:(void (^)(BinAnimationFounder *founder))animationSetting completion:(void (^)(BinAnimationInfo *animationInfo))completion;

- (void)bin_pause;

- (void)bin_resume;

@end
