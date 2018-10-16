#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BinAnimation.h"
#import "BinAnimationFactory.h"
#import "BinAnimationFounder.h"
#import "BinAnimationGroupFactory.h"
#import "BinAnimationPublic.h"
#import "BinKeyframeAnimationFactory.h"
#import "BinKeyframeFactory.h"
#import "BinSpringAnimationFactory.h"
#import "BinTransitionFactory.h"
#import "CALayer+BinAdditions.h"
#import "NSArray+BinAdditions.h"

FOUNDATION_EXPORT double BinAnimationVersionNumber;
FOUNDATION_EXPORT const unsigned char BinAnimationVersionString[];

