//
//  VideoTableViewCell.m
//  Go2ReachSample
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#import "VideoTableViewCell.h"


@implementation VideoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) initVideoView{
    CGFloat sw = [[UIScreen mainScreen] bounds].size.width;
    
    self.frame = CGRectMake(0, 0, sw, 150);
    
    self.grVideo = [[GRVideoView alloc] initVideoWithFrame:CGRectMake(5, 0, sw-10, 150)];
    
    [self addSubview:self.grVideo];
}

@end
