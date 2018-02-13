//
//  React_Native_Open_Settings.m
//  React Native Open Settings
//
//  Created by Michael Morrissey on 11/4/15.
//  Copyright © 2015 Michael Morrissey. All rights reserved.
//

#import "RNOpenSettings.h"

#if __has_include(<React/RCTLog.h>)
#import <React/RCTLog.h>
#elif __has_include("React/RCTLog.h")
#import "React/RCTLog.h"
#else
#import "RCTLog.h"
#endif

#import "RCTConverter+RNOSStatus.h"

@implementation RNOpenSettings

RCT_EXPORT_MODULE(RNOpenSettings);

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(openSettings) {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

RCT_REMAP_METHOD(openSettingsFor, openSettingsFor:(RNOSType)type)
{
    NSString *urlString = nil;

    switch (type) {
        case RNOSTypeLocation:
            RCTLogInfo(@"openSettingsFor location");
            urlString = [[self prefix] stringByAppendingString:@"root=Privacy&path=LOCATION"];
            break;
        case RNOSTypeNotification:
            RCTLogInfo(@"openSettingsFor notification");
            urlString = [[self prefix] stringByAppendingString:@"root=NOTIFICATIONS_ID"];
            break;
        case RNOSTypeBluetooth:
            RCTLogInfo(@"openSettingsFor bluetooth");
            if ([self systemVersionLessThan:@"9.0"]) {
                urlString = [[self prefix] stringByAppendingString:@"root=General&path=Bluetooth"];
            } else {
                urlString = [[self prefix] stringByAppendingString:@"root=Bluetooth"];
            }
            break;
        case RNOSTypeBackgroundRefresh:
            RCTLogInfo(@"openSettingsFor backgroundRefresh");
            urlString = [[self prefix] stringByAppendingString:@"root=General&path=AUTO_CONTENT_DOWNLOAD"];
            break;
        default:
            RCTLogInfo(@"openSettingsFor unknown");
            break;
    }

    if (!urlString) {
        return;
    }

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    return;
}

- (NSString *) prefix
{
    if ([self systemVersionLessThan:@"10.0"]) {
        return @"prefs:";
    }
    return @"App-Prefs:";
}

- (BOOL) systemVersionLessThan:(NSString *)version
{
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    return [systemVersion compare:version options:NSNumericSearch] == NSOrderedAscending;
}

@end
