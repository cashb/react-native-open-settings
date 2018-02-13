//
//  RCTConverter+RNOSStatus.h
//  React Native Open Settings
//
//  Created by Suguru Hamazaki on 2018/02/13.
//  Copyright © 2018 Michael Morrissey. All rights reserved.
//

#ifndef RCTConverter_RNOSStatus_h
#define RCTConverter_RNOSStatus_h

#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#elif __has_include("React/RCTConvert.h")
#import "React/RCTConvert.h"
#else
#import "RCTConvert.h"
#endif

typedef NS_ENUM(NSInteger, RNOSType) {
    RNOSTypeUnknown,
    RNOSTypeLocation,
    RNOSTypeNotification,
    RNOSTypeBluetooth,
    RNOSTypeBackgroundRefresh
};

@interface RCTConvert (RNOSStatus)

@end

#endif /* RCTConverter_RNOSStatus_h */
