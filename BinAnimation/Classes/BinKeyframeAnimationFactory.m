//
//  BinKeyframeAnimationFactory.m
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinKeyframeAnimationFactory.h"

NSString *const BinKeyframeAnimation = @"keyframeAnimation";
NSString *const BinKeyframeAnimationLayer = @"layer";
NSString *const BinKeyframeAnimationGetKeyframeAnimationFirstValue = @"getKeyframeAnimationFirstValue:";

@interface BinKeyframeAnimationFactory ()

@property (nonatomic, weak) CALayer *layer;

/**
 The property name must be BinKeyframeAnimation's value.
 */
@property (nonatomic, weak) CAKeyframeAnimation *keyframeAnimation;

@property (nonatomic, strong) NSDictionary *keyPathDic;

@end

@implementation BinKeyframeAnimationFactory

- (BinKeyframeAnimationFactory *(^)(CGPathRef))path {
    return ^id(CGPathRef path) {
        _keyframeAnimation.path = path;
        return self;
    };
}

- (BinKeyframeAnimationFactory *(^)(NSString *))calculationMode {
    return ^id(NSString *calculationModeName) {
        _keyframeAnimation.calculationMode = calculationModeName;
        return self;
    };
}

- (BinKeyframeAnimationFactory *(^)(NSArray <NSNumber *>*))tensionValues {
    return ^id(NSArray <NSNumber *>*tensionValues) {
        _keyframeAnimation.tensionValues = tensionValues;
        return self;
    };
}

- (BinKeyframeAnimationFactory *(^)(NSArray <NSNumber *>*))continuityValues {
    return ^id(NSArray <NSNumber *>*continuityValues) {
        _keyframeAnimation.continuityValues = continuityValues;
        return self;
    };
}

- (BinKeyframeAnimationFactory *(^)(NSArray <NSNumber *>*))biasValues {
    return ^id(NSArray <NSNumber *>*biasValues) {
        _keyframeAnimation.biasValues = biasValues;
        return self;
    };
}

- (BinKeyframeAnimationFactory *(^)(NSString *))rotationMode {
    return ^id(NSString *rotationModeName) {
        _keyframeAnimation.rotationMode = rotationModeName;
        return self;
    };
}

- (void)getKeyframeAnimation {
    NSMutableArray *valueArr = [NSMutableArray arrayWithArray:_keyframeAnimation.values];
    NSMutableArray *keyTimeArr = [NSMutableArray arrayWithArray:_keyframeAnimation.keyTimes];
    if (valueArr.count == keyTimeArr.count) {
        [valueArr insertObject:[self getKeyframeAnimationFirstValue:_keyframeAnimation.keyPath] atIndex:0];
    }
    self.keyframeAnimation.values = valueArr;
    float keyTimeSum = 0;
    for (NSNumber *keyTimeNumber in keyTimeArr) {
        keyTimeSum += keyTimeNumber.floatValue;
    }
    if (keyTimeSum) {
        [keyTimeArr insertObject:@(0) atIndex:0];
        float keyTimePartSum = 0;
        for (NSInteger i = 1; i < keyTimeArr.count; i++) {
            keyTimePartSum += ((NSNumber *)(keyTimeArr[i])).floatValue;
            keyTimeArr[i] = @(keyTimePartSum / keyTimeSum);
        }
        _keyframeAnimation.keyTimes = keyTimeArr;
        _keyframeAnimation.duration = _keyframeAnimation.duration ?: keyTimeSum;
    } else {
        _keyframeAnimation.keyTimes = nil;
        _keyframeAnimation.timingFunctions = nil;
    }
}

/**
 The method name must be equal to the BinKeyframeAnimationGetKeyframeAnimationFirstValue's value.
 */
- (id)getKeyframeAnimationFirstValue:(NSString *)keyPath {
    NSInteger keyPathNumber = [self.keyPathDic[keyPath] integerValue];
    if (!keyPathNumber) {
        BALog(@"The key path (%@) is not supported, so it will be set at \"transform\".", keyPath);
        keyPathNumber = 1;
    }
    id value = nil;
    switch (keyPathNumber) {
        case 1:
            value = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            break;
//        case 2:
//            break;
        case 3:
            value = @(_layer.borderWidth);
            break;
        case 4:
            value = _layer.contents;
            break;
        case 5:
            value = @(_layer.cornerRadius);
            break;
        case 6:
            value = @(_layer.opacity);
            break;
//        case 7:
//            break;
        case 8:
        {
            CGSize shadowOffset = _layer.shadowOffset;
            value = [NSValue value:&shadowOffset withObjCType:@encode(CGSize)];
        }
            break;
        case 9:
            value = @(_layer.shadowOpacity);
            break;
        case 10:
            value = @(_layer.shadowRadius);
            break;
        case 11:
        {
            CGPoint position = _layer.position;
            value = [NSValue value:&position withObjCType:@encode(CGPoint)];
        }
            break;
        case 12:
            value = @(_layer.position.x);
            break;
        case 13:
            value = @(_layer.position.y);
            break;
        case 14:
        {
            CGRect bounds = _layer.bounds;
            value = [NSValue value:&bounds withObjCType:@encode(CGRect)];
        }
            break;
        case 15:
        {
            CGPoint origin = _layer.bounds.origin;
            value = [NSValue value:&origin withObjCType:@encode(CGPoint)];
        }
            break;
        case 16:
            value = @(_layer.bounds.origin.x);
            break;
        case 17:
            value = @(_layer.bounds.origin.y);
            break;
        case 18:
        {
            CGSize size = _layer.bounds.size;
            value = [NSValue value:&size withObjCType:@encode(CGSize)];
        }
            break;
        case 19:
            value = @(_layer.bounds.size.width);
            break;
        case 20:
            value = @(_layer.bounds.size.height);
            break;
    }
    return value;
}

- (void)setKeyframeAnimation:(CAKeyframeAnimation *)keyframeAnimation {
    _keyframeAnimation = keyframeAnimation;
    [self setValue:keyframeAnimation forKey:BinAnimation];
}

- (void)dealloc {
    if ([[NSThread  callStackSymbols][3] containsString:@"BinKeyframeFactory"]) {
        return;
    }
    [self getKeyframeAnimation];
}

/**
 ...
 backgroundColor
 borderWidth
 contents
 cornerRadius
 opacity
 shadowColor
 shadowOffset
 shadowOpacity
 shadowRadius
 ...
 position
 position.x
 position.y
 ...
 bounds
 bounds.origin
 bounds.origin.x
 bounds.origin.y
 bounds.size
 bounds.size.width
 bounds.size.height
 ...
 
 ...
 The default is transform, so the dictionary does not contain these.
 ...
 transform
 ...
 rotation
 rotation.x
 rotation.y
 rotation.z
 ...
 scale
 scale.x
 scale.y
 scale.z
 ...
 translation
 translation.x
 translation.y
 translation.z
 ...
 */
- (NSDictionary *)keyPathDic {
    if (!_keyPathDic) {
        _keyPathDic = @{
                        @"transform" : @(1),
//                        @"backgroundColor" : @(2),
                        @"borderWidth" : @(3),
                        @"contents" : @(4),
                        @"cornerRadius" : @(5),
                        @"opacity" : @(6),
//                        @"shadowColor" : @(7),
                        @"shadowOffset" : @(8),
                        @"shadowOpacity" : @(9),
                        @"shadowRadius" : @(10),
                        @"position" : @(11),
                        @"position.x" : @(12),
                        @"position.y" : @(13),
                        @"bounds" : @(14),
                        @"bounds.origin" : @(15),
                        @"bounds.origin.x" : @(16),
                        @"bounds.origin.y" : @(17),
                        @"bounds.size" : @(18),
                        @"bounds.size.width" : @(19),
                        @"bounds.size.height" : @(20),
                        };
    }
    return _keyPathDic;
}

@end
