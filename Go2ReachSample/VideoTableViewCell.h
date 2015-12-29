//
//  VideoTableViewCell.h
//  Go2ReachSample
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRVideoView.h"

@interface VideoTableViewCell : UITableViewCell

@property GRVideoView* grVideo;

-(void) initVideoView;

@end
