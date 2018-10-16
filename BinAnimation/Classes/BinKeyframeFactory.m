//
//  BinKeyframeFactory.m
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinKeyframeFactory.h"
#import <UIKit/UIGeometry.h>
#import "BinKeyframeAnimationFactory.h"

NSString *const BinKeyframeKeyframeAnimation = @"keyframeAnimation";
NSString *const BinKeyframeIsFromValue = @"isFromValue";
NSString *const BinKeyframeLayer = @"layer";
NSString *const BinKeyframeBeforeValue = @"beforeValue";
NSString *const BinKeyframeGetKeyframe = @"getKeyframe";

@interface BinKeyframeFactory ()

/**
 The property name must be BinKeyframeKeyframeAnimation's value.
 */
@property (nonatomic, weak) CAKeyframeAnimation *keyframeAnimation;

@property (nonatomic, assign) CATransform3D transform3DTemp;

@property (nonatomic, strong) id valueTemp;
@property (nonatomic, assign) float keyTimeTemp;
@property (nonatomic, strong) NSString *timingFunctionNameTemp;

@property (nonatomic, strong) NSString *keyPathTemp;

/**
 The property name must be BinKeyframeIsFromValue's value.
 */
@property (nonatomic, assign) BOOL isFromValue;

/**
 The property name must be BinKeyframeLayer's value.
 */
@property (nonatomic, weak) CALayer *layer;
@property (nonatomic, strong) id beforeValueTemp;

@end

@implementation BinKeyframeFactory

- (instancetype)init {
    self = [super init];
    if (self) {
        _transform3DTemp = CATransform3DIdentity;
        _timingFunctionNameTemp = kCAMediaTimingFunctionLinear;
        _keyPathTemp = @"transform";
    }
    return self;
}

- (BinKeyframeFactory *(^)(float))translationX {
    return ^id(float pt) {
        return self.translationXYZ(pt, 0.0f, 0.0f);
    };
}

- (BinKeyframeFactory *(^)(float))translationY {
    return ^id(float pt) {
        return self.translationXYZ(0.0f, pt, 0.0f);
    };
}

- (BinKeyframeFactory *(^)(float))translationZ {
    return ^id(float pt) {
        return self.translationXYZ(0.0f, 0.0f, pt);
    };
}

- (BinKeyframeFactory *(^)(float, float, float))translationXYZ {
    return ^id(float xPt, float yPt, float zPt) {
        _transform3DTemp = CATransform3DTranslate(_transform3DTemp, xPt, yPt, zPt);
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))scaleX {
    return ^id(float scale) {
        return self.scaleXYZ(scale, 1.0f, 1.0f);
    };
}

- (BinKeyframeFactory *(^)(float))scaleY {
    return ^id(float scale) {
        return self.scaleXYZ(1.0f, scale, 1.0f);
    };
}

- (BinKeyframeFactory *(^)(float))scaleZ {
    return ^id(float scale) {
        return self.scaleXYZ(1.0f, 1.0f, scale);
    };
}

- (BinKeyframeFactory *(^)(float, float, float))scaleXYZ {
    return ^id(float xScale, float yScale, float zScale) {
        _transform3DTemp = CATransform3DScale(_transform3DTemp, xScale, yScale, zScale);
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))rotationX {
    return ^id(float angle) {
        _transform3DTemp = CATransform3DRotate(_transform3DTemp, angle, 1.0f, 0.0f, 0.0f);
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))rotationY {
    return ^id(float angle) {
        _transform3DTemp = CATransform3DRotate(_transform3DTemp, angle, 0.0f, 1.0f, 0.0f);
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))rotationZ {
    return ^id(float angle) {
        _transform3DTemp = CATransform3DRotate(_transform3DTemp, angle, 0.0f, 0.0f, 1.0f);
        return self;
    };
}

- (BinKeyframeFactory *(^)(float, float, float))rotationXYZ {
    return ^id(float xAngle, float yAngle, float zAngle) {
        _transform3DTemp = CATransform3DRotate(_transform3DTemp, xAngle, 1.0f, 0.0f, 0.0f);
        _transform3DTemp = CATransform3DRotate(_transform3DTemp, yAngle, 0.0f, 1.0f, 0.0f);
        _transform3DTemp = CATransform3DRotate(_transform3DTemp, zAngle, 0.0f, 0.0f, 1.0f);
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))border_width {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}
- (BinKeyframeFactory *(^)(id))contents {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(id contents) {
        _valueTemp = contents;
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))corner_radius {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))opacity {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float scale) {
        _valueTemp = [self get_toValueFromValue:@encode(float), scale];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))shadow_offset {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))shadow_opacity {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))shadow_radius {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(CGPoint))position {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(CGPoint point) {
        _valueTemp = [self get_toValueFromValue:@encode(CGPoint), point];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))position_x {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))position_y {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(CGRect))bounds {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(CGRect rect) {
        _valueTemp = [self get_toValueFromValue:@encode(CGRect), rect];
        return self;
    };
}

- (BinKeyframeFactory *(^)(CGPoint))bounds_origin {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(CGPoint point) {
        _valueTemp = [self get_toValueFromValue:@encode(CGPoint), point];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float pt))bounds_origin_x {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float pt))bounds_origin_y {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(CGSize))bounds_size {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(CGSize size) {
        _valueTemp = [self get_toValueFromValue:@encode(CGSize), size];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float pt))bounds_size_width {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float pt))bounds_size_height {
    [self setKeyFrameAnimationKeyPathWithSelector:_cmd];
    return ^id(float pt) {
        _valueTemp = [self get_toValueFromValue:@encode(float), pt];
        return self;
    };
}

- (BinKeyframeFactory *(^)(float))keyTime {
    return ^id(float second) {
        _keyTimeTemp = second;
        return self;
    };
}

- (BinKeyframeFactory *(^)(NSString *))keyTimingFunction {
    return ^id(NSString *timingFunctionName) {
        _timingFunctionNameTemp = timingFunctionName;
        return self;
    };
}

- (BinKeyframeFactory *(^)(id))value {
    return ^id(id value) {
        _valueTemp = value;
        return self;
    };
}

- (void)setKeyFrameAnimationKeyPathWithSelector:(SEL)selector {
    _keyPathTemp = [NSStringFromSelector(selector) stringByReplacingOccurrencesOfString:@"_" withString:@"."];
}

- (id)get_toValueFromValue:(const char *)type, ... {
    va_list v;
    va_start(v, type);
    id toValue = nil;
    if (_layer && !_beforeValueTemp) {
        BinKeyframeAnimationFactory *keyframeAnimationFactory = [[BinKeyframeAnimationFactory alloc] init];
        [keyframeAnimationFactory setValue:_layer forKey:BinKeyframeAnimationLayer];
        SEL sel = NSSelectorFromString(BinKeyframeAnimationGetKeyframeAnimationFirstValue);
        IMP imp = [keyframeAnimationFactory methodForSelector:sel];
        id (*fun)(id, SEL, NSString *) = (void *)imp;
        _beforeValueTemp = fun(keyframeAnimationFactory, sel, _keyPathTemp);
    }
    if (strcmp(type, @encode(float)) == 0) {
        float byValue = (float)va_arg(v, double);
        float fromValue = [_beforeValueTemp isKindOfClass:[NSNumber class]] ? ((NSNumber *)_beforeValueTemp).floatValue : 0;
        toValue = @(byValue + fromValue);
    } else if (strcmp(type, @encode(CGPoint)) == 0) {
        CGPoint byValue = (CGPoint)va_arg(v, CGPoint);
        CGPoint fromValue = [_beforeValueTemp isKindOfClass:[NSValue class]] ? ((NSValue *)_beforeValueTemp).CGPointValue : CGPointZero;
        byValue.x += fromValue.x;
        byValue.y += fromValue.y;
        toValue = [NSValue value:&byValue withObjCType:type];
    } else if (strcmp(type, @encode(CGSize)) == 0) {
        CGSize byValue = (CGSize)va_arg(v, CGSize);
        CGSize fromValue = [_beforeValueTemp isKindOfClass:[NSValue class]] ? ((NSValue *)_beforeValueTemp).CGSizeValue : CGSizeZero;
        byValue.width += fromValue.width;
        byValue.height += fromValue.height;
        toValue = [NSValue value:&byValue withObjCType:type];
    } else if (strcmp(type, @encode(CGRect)) == 0) {
        CGRect byValue = (CGRect)va_arg(v, CGRect);
        CGRect fromValue = [_beforeValueTemp isKindOfClass:[NSValue class]] ? ((NSValue *)_beforeValueTemp).CGRectValue : CGRectZero;
        byValue.origin.x += fromValue.origin.x;
        byValue.origin.y += fromValue.origin.y;
        byValue.size.width += fromValue.size.width;
        byValue.size.height += fromValue.size.height;
        toValue = [NSValue value:&byValue withObjCType:type];
    }
    return toValue;
}

- (void)setKeyframeAnimation:(CAKeyframeAnimation *)keyframeAnimation {
    _keyframeAnimation = keyframeAnimation;
    [self setValue:keyframeAnimation forKey:BinAnimation];
}

/**
 The method name must be the "set" method of BinKeyframeBeforeValue's value.
 */
- (void)setBeforeValue:(id)beforeValue {
    _beforeValueTemp = beforeValue;
    if ([beforeValue isKindOfClass:[NSValue class]]) {
        _transform3DTemp = ((NSValue *)beforeValue).CATransform3DValue;
    }
}

/**
 The method name must be the "set" method of BinKeyframeGetKeyframe's value.
 */
- (void)getKeyframe {
    self.keyframeAnimation.keyPath = _keyPathTemp;
    
    NSMutableArray *valueArr = [NSMutableArray arrayWithArray:_keyframeAnimation.values];
    [valueArr insertObject:(_valueTemp ?  : [NSValue valueWithCATransform3D:_transform3DTemp]) atIndex:(_isFromValue ? 0 : valueArr.count)];
    _keyframeAnimation.values = valueArr;
    
    if (!_isFromValue) {
        NSMutableArray *keyTimeArr = [NSMutableArray arrayWithArray:_keyframeAnimation.keyTimes];
        [keyTimeArr insertObject:@(_keyTimeTemp) atIndex:keyTimeArr.count];
        _keyframeAnimation.keyTimes = keyTimeArr;
        
        NSMutableArray *timingFunctionArr = [NSMutableArray arrayWithArray:_keyframeAnimation.timingFunctions];
        [timingFunctionArr insertObject:[CAMediaTimingFunction functionWithName:_timingFunctionNameTemp] atIndex:timingFunctionArr.count];
        _keyframeAnimation.timingFunctions = timingFunctionArr;
    }
}

@end
