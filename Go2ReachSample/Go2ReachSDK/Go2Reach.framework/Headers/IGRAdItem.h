//
//  GRIAdItem.h
//  Go2ReachSample
//
//  Created by apple on 15/10/23.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#ifndef GRIAdItem_h
#define GRIAdItem_h



#define GR_AD_ITEM_ICON @"icon"
#define GR_AD_ITEM_IMAGE @"image"
#define GR_AD_ITEM_TITLE @"title"
#define GR_AD_ITEM_RATE @"rate"
#define GR_AD_ITEM_SUBTITLE @"subtitle"
#define GR_AD_ITEM_BODY @"body"
#define GR_AD_ITEM_CALL2ACTION @"cta"
#define GR_AD_ITEM_RICH_WEB_VIEW @"rwv"
#define GR_AD_ITEM_VIDEO @"video"

#define AD_TYPE_LINK @"link"
#define AD_TYPE_APP @"app"
#define AD_TYPE_VIDEO @"video"
#define AD_TYPE_ADPLAY @"adplay"

#define AD_PROP_CREATIVE_ID @"ctv_id"
#define AD_PROP_CAMPAIGN_ID @"cmp_id"
#define AD_PROP_GROUP_ID @"grp_id"

@interface GRAdImage : NSObject
@property NSString* url;
@property int width;
@property int height;
@end

@interface GRAdRichWebView : NSObject
@property NSString* url;
@property NSString* file;
@end

@interface GRAdVideo : NSObject
@property NSString* url;
@property GRAdImage* cover;
@property int width;
@property int height;
@end


#endif /* GRIAdItem_h */
