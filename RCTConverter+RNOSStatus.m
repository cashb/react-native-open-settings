//
//  RCTConverter+RNOSStatus.m
//  React Native Open Settings
//
//  Created by Suguru Hamazaki on 2018/02/13.
//  Copyright © 2018 Michael Morrissey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTConverter+RNOSStatus.h"

@implementation RCTConvert (RNOSStatus)

RCT_ENUM_CONVERTER(RNOSType, (@{ @"location" : @(RNOSTypeLocation),
                                 @"notification" : @(RNOSTypeNotification),
                                 @"bluetooth" : @(RNOSTypeBluetooth),
                                 @"backgroundRefresh" : @(RNOSTypeBackgroundRefresh)
                                 }), RNOSTypeUnknown, integerValue)

@end
