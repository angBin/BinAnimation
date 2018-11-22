//
//  BinAnimationFounder.m
//  BinAnimation
//
//  Created by angBin on 2018/9/14.
//  Copyright © 2018年 angBin. All rights reserved.
//

#import "BinAnimationFounder.h"
#import "BinKeyframeAnimationFactory.h"
#import "BinSpringAnimationFactory.h"
#import "BinTransitionFactory.h"
#import "BinAnimationGroupFactory.h"
#import "BinKeyframeFactory.h"

@interface BinAnimationFounder ()

@property (nonatomic, strong) NSArray *layerArr;

@property (nonatomic, strong) CAAnimation *currentAnimation;

@property (nonatomic, strong) NSMutableArray *animationArr;

@property (nonatomic, strong) BinKeyframeFactory *keyframeFactory;

@property (nonatomic, weak) NSMutableArray *actualAnimationArr;

@end

@implementation BinAnimationFounder

- (instancetype)initWithLayer:(NSArray *)layerArr {
    self = [super init];
    if (self) {
        _layerArr = layerArr.mutableCopy;
        _animationArr = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)build {
    [self saveAnimationWithIsCurrent:NO];
    NSMutableArray *actualAnimationArr = [NSMutableArray array];
    for (NSInteger i = _animationArr.count - 1; i >= 0; i--) {
        if ([_animationArr[i] isKindOfClass:[CAAnimationGroup class]]) {
            CAAnimationGroup *animationGroup = _animationArr[i];
            NSMutableArray *animationGroupAnimationArr = [NSMutableArray array];
            for (i--; (i >= 0 && ![_animationArr[i] isKindOfClass:[CAAnimationGroup class]]); i--) {
                [animationGroupAnimationArr addObject:_animationArr[i]];
            }
            animationGroup.animations = animationGroupAnimationArr;
            [actualAnimationArr addObject:animationGroup];
            i++;
        } else {
            [actualAnimationArr addObject:_animationArr[i]];
        }
    }
    actualAnimationArr = (NSMutableArray *)actualAnimationArr.reverseObjectEnumerator.allObjects;
    [_actualAnimationArr addObjectsFromArray:actualAnimationArr];
    return (actualAnimationArr.count ? actualAnimationArr : nil);
}

- (BinKeyframeFactory *)fromKeyframe {
    BinKeyframeFactory *keyframeFactory = [self toKeyframe];
    [keyframeFactory setValue:@YES forKey:BinKeyframeIsFromValue];
    return keyframeFactory;
}

- (BinKeyframeFactory *)toKeyframe {
    [_keyframeFactory valueForKey:BinKeyframeGetKeyframe];
    BinKeyframeFactory *keyframeFactory = [[BinKeyframeFactory alloc] init];
    [keyframeFactory setValue:self.currentAnimation forKey:BinKeyframeKeyframeAnimation];
    _keyframeFactory = keyframeFactory;
    return keyframeFactory;
}

- (BinKeyframeFactory *)byKeyframe {
    BinKeyframeFactory *keyframeFactory = [self toKeyframe];
    [keyframeFactory setValue:_layerArr.firstObject forKey:BinKeyframeLayer];
    id beforeKeyframe = ((CAKeyframeAnimation *)_currentAnimation).values.lastObject;
    [keyframeFactory setValue:beforeKeyframe forKey:BinKeyframeBeforeValue];
    return keyframeFactory;
}

- (BinKeyframeAnimationFactory *)keyframeAnimation {
    [_keyframeFactory valueForKey:BinKeyframeGetKeyframe];
    _keyframeFactory = nil;
    BinKeyframeAnimationFactory *keyframeAnimationFactory = [[BinKeyframeAnimationFactory alloc] init];
    [keyframeAnimationFactory setValue:self.currentAnimation forKey:BinKeyframeAnimation];
    [keyframeAnimationFactory setValue:_layerArr.firstObject forKey:BinKeyframeAnimationLayer];
    [self saveAnimationWithIsCurrent:YES];
    return keyframeAnimationFactory;
}

- (BinKeyframeAnimationFactory *(^)(NSString *))moreKeyframeAnimation {
    return ^id(NSString *keyPath) {
        BinKeyframeAnimationFactory *keyframeAnimationFactory = [self keyframeAnimation];
        ((CAKeyframeAnimation *)(_animationArr.lastObject)).keyPath = keyPath;
        return keyframeAnimationFactory;
    };
}

- (BinSpringAnimationFactory *)springAnimation {
    [self saveAnimationWithIsCurrent:NO];
    BinSpringAnimationFactory *springAnimationFactory = [[BinSpringAnimationFactory alloc] init];
    [springAnimationFactory setValue:self.currentAnimation forKey:BinSpringAnimation];
    [self saveAnimationWithIsCurrent:YES];
    return springAnimationFactory;
}

- (BinSpringAnimationFactory *(^)(NSString *))moreSpringAnimation {
    return ^id(NSString *keyPath) {
        BinSpringAnimationFactory *springAnimationFactory = [self springAnimation];
        if (@available(iOS 9.0, *)) {
            ((CASpringAnimation *)_animationArr.lastObject).keyPath = keyPath;
        } else {
            BALog(@"'BinSpringAnimation' is only available on iOS 9.0 or newer.");
            return nil;
        }
        return springAnimationFactory;
    };
}

- (BinTransitionFactory *)transition {
    [self saveAnimationWithIsCurrent:NO];
    BinTransitionFactory *transitionFactory = [[BinTransitionFactory alloc] init];
    [transitionFactory setValue:self.currentAnimation forKey:BinTransition];
    [self saveAnimationWithIsCurrent:YES];
    return transitionFactory;
}

- (BinAnimationGroupFactory *)animationGroup {
    [self saveAnimationWithIsCurrent:NO];
    BinAnimationGroupFactory *animationGroup = [[BinAnimationGroupFactory alloc] init];
    [animationGroup setValue:self.currentAnimation forKey:BinAnimationGroup];
    [self saveAnimationWithIsCurrent:YES];
    return animationGroup;
}

- (void (^)(NSMutableArray *))getAnimationArr {
    return ^(NSMutableArray *animationArr) {
        _actualAnimationArr = animationArr;
    };
}

- (void)saveAnimationWithIsCurrent:(BOOL)isCurrent {
    if (_currentAnimation) {
        if (!isCurrent && [_currentAnimation isKindOfClass:[CAKeyframeAnimation class]]) {
            @autoreleasepool {
                [self keyframeAnimation];
            }
            return;
        }
        [_animationArr addObject:_currentAnimation];
        _currentAnimation = nil;
    }
}

- (CAAnimation *)currentAnimation {
    if (!_currentAnimation) {
        NSString *callStackSymbol = [NSThread  callStackSymbols][1].lowercaseString;
        if ([callStackSymbol containsString:@"keyframe"]) {
            CAKeyframeAnimation *animationTemp = [CAKeyframeAnimation animation];
            _currentAnimation = animationTemp;
        } else if ([callStackSymbol containsString:@"animationgroup"]) {
            CAAnimationGroup *animationTemp = [CAAnimationGroup animation];
            _currentAnimation = animationTemp;
        } else if ([callStackSymbol containsString:@"spring"]) {
            CASpringAnimation *animationTemp = [CASpringAnimation animation];
            _currentAnimation = animationTemp;
        } else if ([callStackSymbol containsString:@"transition"]) {
            CATransition *animationTemp = [CATransition animation];
            _currentAnimation = animationTemp;
        }
    }
    return _currentAnimation;
}

@end
