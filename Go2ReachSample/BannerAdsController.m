//
//  BannerAdsController.m
//  Go2ReachSample
//
//  Created by apple on 15/12/21.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#import "BannerAdsController.h"
#import "GRServices.h"
#import "GRAdService.h"
#import "GRBannerAd.h"

@interface BannerAdsController ()

@property GRBannerAd* bTopAd;
@property GRBannerAd* bBottomAd;
@property BOOL isAddedBottomAd;
@end

@implementation BannerAdsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
    self.bTopAd = [adService getBannerAd:@"banner.top"];
    
    UIView* bView = [self.bTopAd create];
    if (bView != nil){
        CGPoint vpoint = self.view.center;
        //vpoint.y = 64;
        bView.center = vpoint;
        CGRect bvFrame = bView.frame;
        bvFrame.origin.y = 64;
        bView.frame = bvFrame;
        [self.view addSubview:bView];
    }
    
    self.bBottomAd = [adService getBannerAd:@"banner.bottom" imageWidth:GR_IAD_SIZE_FULL_SCREEN imageHeight:60 requiredFields:[NSMutableArray arrayWithObjects:GR_AD_ITEM_VIDEO, nil]];
    UIView* bottomView = [self.bBottomAd create];
    if (bottomView != nil){
        CGPoint vpoint = self.view.center;
        vpoint.y = [[UIScreen mainScreen] bounds].size.height - (bottomView.frame.size.height/2);
        bottomView.center = vpoint;
        [self.view addSubview:bottomView];
        self.isAddedBottomAd = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnBottomBannerClicked:(id)sender {
    if (self.isAddedBottomAd == NO){
        self.isAddedBottomAd = YES;
        [self.bBottomAd load];
    }
}

-(void)viewDidDisappear:(BOOL)animated{
    [self.bTopAd stopReloadInterval];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.bTopAd setReloadInterval:60]; // auto refresh time (seconds)
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
