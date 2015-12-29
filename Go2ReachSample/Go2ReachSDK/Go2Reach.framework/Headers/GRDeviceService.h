//
//  GRDeviceService.h
//  Go2Reach
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 Gmobi. All rights reserved.
//

#ifndef Go2Reach_GRDeviceService_h
#define Go2Reach_GRDeviceService_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "GRSystemHelper.h"

#define GR_SDK @"Go2Reach"
#define GR_SDK_VERSION @"0.1"
#define GR_SDK_BUILD @"2015.07.30.1"


@interface GRDeviceService: NSObject

@property NSString* appChannel;
@property CTTelephonyNetworkInfo* networkStatus;
@property NSString* currentStatus;

-(NSString*) getSDK;
-(NSString*) getSDKVersion;
-(NSString*) getSDKBuild;
-(NSString*) getAPPID;
-(NSString*) getAppChannel;
-(NSString*) getAPPVersion;
-(NSString*) getUA;
-(NSString*) getOS;
-(NSString*) getOSVersion;
-(NSString*) getAdvertisingID;
-(NSString*) getVendorID;

-(int) getScreenWidth;
-(int) getScreenHeight;
-(int) getScreenDPI;


-(NSMutableDictionary*) getDeviceInfoAsDict;
-(NSString*) getDeviceNetworkType;
@end

#endif
