//
//  BinExamplePublic.m
//  BinAnimation_Example
//
//  Created by angBin on 2018/12/17.
//  Copyright © 2018 angBin. All rights reserved.
//

#import "BinExamplePublic.h"

@implementation BinExamplePublic

CGFloat bin_screenWidth(void) {
    return UIScreen.mainScreen.bounds.size.width;
}

CGFloat bin_screenHeight(void) {
    return UIScreen.mainScreen.bounds.size.height;
}

CGFloat bin_widthExceptNavBar(void) {
    return bin_screenWidth();
}

CGFloat bin_heightExceptNavBar(void) {
    return bin_screenHeight()-64;
}

UIColor * bin_bgColor(void) {
    return UIColor.whiteColor;
}

UIColor * bin_tintColor1(void) {
    return UIColor.redColor;
}

UIColor * bin_tintColor2(void) {
    return UIColor.greenColor;
}

@end
