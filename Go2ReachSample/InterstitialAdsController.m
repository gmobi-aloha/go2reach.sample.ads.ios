//
//  InterstitialAdsController.m
//  Go2ReachSample
//
//  Created by apple on 15/12/21.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#import "InterstitialAdsController.h"
#import "GRServices.h"
#import "GRAdService.h"
#import "GRInterstitialAd.h"

@interface InterstitialAdsController ()

@end

@implementation InterstitialAdsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnDefultClicked:(id)sender {
    GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
    GRInterstitialAd* iAd = [adService getInterstitialAd:@"intersitital.default"];
    [iAd popup];
}

- (IBAction)btnCustomSizeClicked:(id)sender {
    GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
    GRInterstitialAd* iAd = [adService getInterstitialAd:@"intersitital.custom" portraitWidth:300 portraitHeight:250 landscapeWidth:500 landscapeHeight:300 requiredFields:nil];
    [iAd popup];
}

- (IBAction)btnVideoFilterClicked:(id)sender {
    GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
    GRInterstitialAd* iAd = [adService getInterstitialAd:@"intersitital.video" portraitWidth:300 portraitHeight:250 landscapeWidth:500 landscapeHeight:300 requiredFields:[NSMutableArray arrayWithObjects:GR_AD_ITEM_VIDEO, nil]];
    [iAd popup];
}

- (IBAction)btnFullScreenClicked:(id)sender {
    GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
    GRInterstitialAd* iAd = [adService getInterstitialAd:@"intersitital.fullscreen" portraitWidth:GR_IAD_SIZE_FULL_SCREEN portraitHeight:GR_IAD_SIZE_FULL_SCREEN landscapeWidth:GR_IAD_SIZE_FULL_SCREEN landscapeHeight:GR_IAD_SIZE_FULL_SCREEN requiredFields:nil];
    [iAd popup];
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
