//
//  NativeAdsController.m
//  Go2ReachSample
//
//  Created by apple on 15/12/21.
//  Copyright © 2015年 Gmobi. All rights reserved.
//

#import "NativeAdsController.h"


@interface MyTestTableItem : NSObject

@property NSString* itemTitle;

@end

@implementation MyTestTableItem

@end


@interface NativeAdsController () 

@property GRNativeAd* nImageAd;
@property GRNativeAd* nAd;
@property GRNativeAd* nVideoAd;

@property UITableView* myTable;
@property NSMutableArray* myDataArray;

@end

@implementation NativeAdsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat sw = [[UIScreen mainScreen] bounds].size.width;
    CGFloat sh = [[UIScreen mainScreen] bounds].size.height;
    
    UIImageView* imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 70, sw - 20 - 100, 100);
    [self.view addSubview:imageView];
    
    UILabel* titleLab = [[UILabel alloc] init];
    titleLab.frame = CGRectMake(sw - 90, 70, 80, 40);
    [self.view addSubview:titleLab];
    
    UIButton* adACBtn = [[UIButton alloc] init];
    adACBtn.frame = CGRectMake(sw - 90, 140, 80, 30);
    [adACBtn setFont:[UIFont systemFontOfSize:14.0]];
    [adACBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [adACBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:adACBtn];
    
    GRAdService* adService = [GRServices get:GR_SERVICE_TYPE_AD];
    self.nImageAd = [adService getNativeAd:@"native.image" preferredImageWidth:440 perferredImageHeight:320 count:1 requiredFields:[NSMutableArray arrayWithObjects:GR_AD_ITEM_IMAGE, nil]];
    GRAdItem* adItem = [self.nImageAd getAdItem:0];
    if (adItem){
        NSMutableDictionary* views = [NSMutableDictionary dictionaryWithCapacity:1];
        [views setObject:imageView forKey:GR_AD_ITEM_IMAGE];
        [views setObject:titleLab forKey:GR_AD_ITEM_TITLE];
        [views setObject:adACBtn forKey:GR_AD_ITEM_CALL2ACTION];
        
        [adItem bind:views];
    }
    [self.nImageAd load];
    
    UIView* sepLine = [[UIView alloc] init];
    sepLine.frame = CGRectMake(0, 172, sw, 1);
    sepLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:sepLine];
    
    UIImageView* iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(10, 175, 50, 50);
    [self.view addSubview:iconView];
    
    UILabel* titleLab2 = [[UILabel alloc] init];
    titleLab2.frame = CGRectMake(70, 175, sw - 150, 20);
    [self.view addSubview:titleLab2];
    
    // Rateing view can used your own view class.  Just implement protocol "IGRRateView".
    GRRateBar* starBar = [[GRRateBar alloc] initRateView:CGRectMake(70, 205, sw - 150, 20) maxStar:5 selStar:0];
    [self.view addSubview:starBar];
    
    UIButton* adACBtn2 = [[UIButton alloc] init];
    adACBtn2.frame = CGRectMake(sw-80, 175, 70, 50);
    [adACBtn2 setFont:[UIFont systemFontOfSize:14.0]];
    [adACBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [adACBtn2 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:adACBtn2];
    
    self.nAd = [adService getNativeAd:@"native.default" preferredImageWidth:50 perferredImageHeight:50 count:1 requiredFields:nil];
    GRAdItem* nAdItem = [self.nAd getAdItem:0];
    if (nAdItem){
        NSMutableDictionary* views = [NSMutableDictionary dictionaryWithCapacity:1];
        [views setObject:iconView forKey:GR_AD_ITEM_ICON];
        [views setObject:titleLab2 forKey:GR_AD_ITEM_TITLE];
        [views setObject:adACBtn2 forKey:GR_AD_ITEM_CALL2ACTION];
        [views setObject:starBar forKey:GR_AD_ITEM_RATE];
        
        [nAdItem bind:views];
    }
    [self.nAd load];
    
    if (self.myDataArray == nil)
        self.myDataArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < 30; i++) {
        MyTestTableItem* item = [MyTestTableItem alloc];
        item.itemTitle = [NSString stringWithFormat:@"Cell %d", i+1];
        [self.myDataArray addObject:item];
    }
    
    self.myTable = [[UITableView alloc] init];
    self.myTable.frame = CGRectMake(0, 230, sw, sh-230);
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    [self.view addSubview:self.myTable];
    
    self.nVideoAd = [adService getNativeAd:@"native.video" preferredImageWidth:320 perferredImageHeight:150 count:3 requiredFields:[NSMutableArray arrayWithObjects:@"video", nil]];
    self.nVideoAd.grAdDelegate = self;
    [self.nVideoAd setAutoPlayMode:YES];
    [self.nVideoAd load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) GRAdOnLoaded: (id) sender
          resultCode: (int) resultCode
              result: (id) result{
    if (self.nVideoAd != nil){
        for (int i = 0; i < [self.nVideoAd getAdCount]; i++) {
            GRAdItem* item = [self.nVideoAd getAdItem:i];
            [self.myDataArray insertObject:item atIndex:(i+1) * 6];
        }
        [self.myTable reloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.myDataArray != nil)
        return [self.myDataArray count];
    else
        return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myDataArray == nil || indexPath.row > [self.myDataArray count]) return 1;
    
    id item = [self.myDataArray objectAtIndex:indexPath.row];
    if (item != nil && [item isKindOfClass:[MyTestTableItem class]]){
        return 40;
    } else if (item != nil && [item isKindOfClass:[GRAdItem class]]){
        return 150;
    } else
        return 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myDataArray == nil || indexPath.row > [self.myDataArray count]){
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    id item = [self.myDataArray objectAtIndex:indexPath.row];
    if (item != nil && [item isKindOfClass:[MyTestTableItem class]]){
        UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        MyTestTableItem* mTItem = (MyTestTableItem*)item;
        cell.textLabel.text = mTItem.itemTitle;
        return cell;
    } else if (item != nil && [item isKindOfClass:[GRAdItem class]]){
        VideoTableViewCell* tCell = [[VideoTableViewCell alloc] init];
        [tCell initVideoView];
        
        GRAdItem* grItem = (GRAdItem*)item;
        if (grItem){
            NSMutableDictionary* views = [NSMutableDictionary dictionaryWithCapacity:1];
            [views setObject:tCell.grVideo forKey:GR_AD_ITEM_VIDEO];
            [grItem bind:views];
        }
        
        return tCell;
    } else
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}





@end
