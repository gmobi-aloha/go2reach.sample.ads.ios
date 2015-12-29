//
//  NativeAdsController.h
//  Go2ReachSample
//
//  Created by apple on 15/12/21.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRServices.h"
#import "GRAdService.h"
#import "GRNativeAd.h"
#import "GRRateBar.h"
#import "VideoTableViewCell.h"

@interface NativeAdsController : UIViewController <UITableViewDataSource, UITableViewDelegate, GRAdCallbackDelegate>

@end
