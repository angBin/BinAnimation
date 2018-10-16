//
//  BinAnimationPublic.h
//  BinAnimation
//
//  Created by angBin on 2018/9/16.
//  Copyright © 2018年 angBin. All rights reserved.
//

#ifndef BinAnimationPublic_h
#define BinAnimationPublic_h

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#ifdef DEBUG
#define BALog(format, ...)   NSLog((@"BinAnimationLog: %s [Line %d] " format), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define BALog(...)
#endif

#endif /* BinAnimationPublic_h */
