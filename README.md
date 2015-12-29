###Getting Started
Add sdk framework and Go2Reach.bundle file to the ***Frameworks*** folder of your IOS project.

Register your application in Go2Reach backend and add the "Go2ReachADKey" key in info.plist
```xml
<key>Go2ReachADKey</key>
<string>563095ffd59f040f5ed5c664</string>
```

Open sdk log
```objective-c
[GRServices debugMode:YES];
```

### Banner Ad
* Get the ad service instance
```objective-c
GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
```
* Create a banner ad with a preferred unique placement name
```objective-c
GRBannerAd* adTop = [adService getBannerAd:@"banner.top"];
```
You could also get a specific size banner 
```objective-c
GRBannerAd* adTop = [adService getBannerAd:@"banner.bottom" imageWidth:-1 imageHeight:60 requiredFields:nil]; // full width x 60dp
GRBannerAd* adTop = [adService getBannerAd:@"banner.bottom" imageWidth:320 imageHeight:60 requiredFields:nil]; // 320pt x 60pt
```
* Create banner view and put it where you want the banner to display
```objective-c
UIView* banner = [adTop create];
[self.view addSubview:banner];
```
You could make it auto reload with specific interval
```objective-c
[adTop setReloadInterval:60]; // make the banner auto reload every 60 seconds
```

### Interstitial Ad
* Get the ad service instance
```objective-c
GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
```
* Create an interstitial ad with a preferred unique placement name
```objective-c
GRInterstitialAd* ad = [adService getInterstitialAd:@"intersitital.default"];
```
You could also customize the size. Display an interstitial ad as 300pt x 500pt in protrait mode and  500pt x 300pt in landscape mode
```objective-c
GRInterstitialAd* ad = [adService getInterstitialAd:@"intersitital.custom" portraitWidth:300 portraitHeight:250 landscapeWidth:500 landscapeHeight:300 requiredFields:nil];
```
Display an interstitial ad in full screen mode
```objective-c
GRInterstitialAd* ad = [adService getInterstitialAd:@"intersitital.fullscreen" portraitWidth:-1 portraitHeight:-1 landscapeWidth:-1 landscapeHeight:-1 requiredFields:nil]; 
```
* Popup the interstitial ad
```objective-c
[ad popup];
```

### Native Ad
* Get the ad service instance
```objective-c
GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
```
* Create a native ad with a preferred unique placement name
```objective-c
GRNativeAd* nAd = [adService getNativeAd:@"native.default" preferredImageWidth:50 perferredImageHeight:50 count:1 requiredFields:nil];
// create 1 native ad with 50pt x 50pt preferred size image
```
* Bind native ad elements with specific views
```objective-c
UIImageView* iconView = [[UIImageView alloc] init];
iconView.frame = CGRectMake(10, 175, 50, 50);
[self.view addSubview:iconView];
    
UILabel* titleLab = [[UILabel alloc] init];
titleLab.frame = CGRectMake(70, 175, sw - 150, 20);
[self.view addSubview:titleLab];

// Rateing view can used your own view class.  Just implement protocol "IGRRateView".
GRRateBar* starBar = [[GRRateBar alloc] initRateView:CGRectMake(70, 205, sw - 150, 20) maxStar:5 selStar:0];
[self.view addSubview:starBar];
    
UIButton* adACBtn = [[UIButton alloc] init];
adACBtn.frame = CGRectMake(sw-80, 175, 70, 50);
[adACBtn setFont:[UIFont systemFontOfSize:14.0]];
[adACBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
[adACBtn setBackgroundColor:[UIColor greenColor]];
[self.view addSubview:adACBtn];

GRAdItem* nAdItem = [nAd getAdItem:0];
    if (nAdItem){
        NSMutableDictionary* views = [NSMutableDictionary dictionaryWithCapacity:1];
        [views setObject:iconView forKey:GR_AD_ITEM_ICON];
        [views setObject:titleLab forKey:GR_AD_ITEM_TITLE];
        [views setObject:adACBtn forKey:GR_AD_ITEM_CALL2ACTION];
        [views setObject:starBar forKey:GR_AD_ITEM_RATE];
        
        [nAdItem bind:views];
    }
```
* Load the ad and make it visible 
```objective-c
[nAd load];
```
