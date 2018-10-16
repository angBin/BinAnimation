//
//  BinKeyframeFactory.h
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationFactory.h"

FOUNDATION_EXTERN NSString *const BinKeyframeKeyframeAnimation;
FOUNDATION_EXTERN NSString *const BinKeyframeIsFromValue;
FOUNDATION_EXTERN NSString *const BinKeyframeLayer;
FOUNDATION_EXTERN NSString *const BinKeyframeBeforeValue;
FOUNDATION_EXTERN NSString *const BinKeyframeGetKeyframe;

/**
 Provide interface of the keyframe animation's property.
 */
@interface BinKeyframeFactory : BinAnimationFactory

/**
 Transformation: translation, scale, rotation.
 */
- (BinKeyframeFactory *(^)(float pt))translationX;
- (BinKeyframeFactory *(^)(float pt))translationY;
- (BinKeyframeFactory *(^)(float pt))translationZ;
- (BinKeyframeFactory *(^)(float xPt, float yPt, float zPt))translationXYZ;

- (BinKeyframeFactory *(^)(float scale))scaleX;
- (BinKeyframeFactory *(^)(float scale))scaleY;
- (BinKeyframeFactory *(^)(float scale))scaleZ;
- (BinKeyframeFactory *(^)(float xScale, float yScale, float zScale))scaleXYZ;

- (BinKeyframeFactory *(^)(float angle))rotationX;
- (BinKeyframeFactory *(^)(float angle))rotationY;
- (BinKeyframeFactory *(^)(float angle))rotationZ;
- (BinKeyframeFactory *(^)(float xAngle, float yAngle, float zAngle))rotationXYZ;

/**
 Property.
 */
- (BinKeyframeFactory *(^)(float pt))border_width;
- (BinKeyframeFactory *(^)(id contents))contents;
- (BinKeyframeFactory *(^)(float pt))corner_radius;
- (BinKeyframeFactory *(^)(float scale))opacity;
- (BinKeyframeFactory *(^)(float pt))shadow_offset;
- (BinKeyframeFactory *(^)(float scale))shadow_opacity;
- (BinKeyframeFactory *(^)(float pt))shadow_radius;
- (BinKeyframeFactory *(^)(CGPoint point))position;
- (BinKeyframeFactory *(^)(float pt))position_x;
- (BinKeyframeFactory *(^)(float pt))position_y;
- (BinKeyframeFactory *(^)(CGRect rect))bounds;
- (BinKeyframeFactory *(^)(CGPoint point))bounds_origin;
- (BinKeyframeFactory *(^)(float pt))bounds_origin_x;
- (BinKeyframeFactory *(^)(float pt))bounds_origin_y;
- (BinKeyframeFactory *(^)(CGSize size))bounds_size;
- (BinKeyframeFactory *(^)(float pt))bounds_size_width;
- (BinKeyframeFactory *(^)(float pt))bounds_size_height;

/**
 The duration from the previous frame to the current frame.
 */
- (BinKeyframeFactory *(^)(float second))keyTime;

/**
 The timing function from the previous frame to the current frame.
 */
- (BinKeyframeFactory *(^)(NSString *timingFunctionName))keyTimingFunction;

/**
 Any value.
 */
- (BinKeyframeFactory *(^)(id value))value;

@end
