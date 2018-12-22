//
//  BinExamplePublic.h
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/17.
//  Copyright © 2018 angBin. All rights reserved.
//

#ifndef BinExamplePublic_h
#define BinExamplePublic_h

#import <Foundation/Foundation.h>
#import "BinAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface BinExamplePublic : NSObject

CGFloat bin_screenWidth(void);

CGFloat bin_screenHeight(void);

CGFloat bin_widthExceptNavBar(void);

CGFloat bin_heightExceptNavBar(void);

UIColor * bin_bgColor(void);

UIColor * bin_tintColor1(void);

UIColor * bin_tintColor2(void);

@end

NS_ASSUME_NONNULL_END

#endif
