//
//  itemUI.m
//  Candy
//
//  Created by Callum Beckwith on 26/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "itemUI.h"
#import "sweetInventoryData.h"
#import "confirmSale.h"
#import "confirmGemSale.h"
#import "wrappedPacket.h"
#import "lollyPacket.h"
#import "chewPacket.h"
#import "jawbreakerPacket.h"
#import "bonbonPacket.h"
#import "trendsData.h"
#import "candybarPacket.h"
#import "marshmallowPacket.h"
#import "pencilPacket.h"
#import "eggPacket.h"

@implementation itemUI

+(void)createNewItemUi: (UIView*)v slotId:(int)slotNo {
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    NSString *textureName = [slotData objectForKey:@"sweet_texture"];
    NSString *name = [slotData objectForKey:@"sweet_name"];
    NSString *color = [slotData objectForKey:@"sweet_color"];
    
    UIView *mainItem = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, v.frame.size.height/4.5, v.frame.size.width, v.frame.size.height - v.frame.size.height/4.5 - v.frame.size.height/6)];
    
    UIImage *topBarImage = [UIImage imageNamed:@"invItemHeader"];
    UIImage *backgroundImage = [UIImage imageNamed:@"invItemBg"];
    UIImage *sweetTextureImage = [UIImage imageNamed:textureName];
    UIImage *titleBgImage = [UIImage imageNamed:[self titleColorDecider:color]];
    UIImage *coinSellImage = [UIImage imageNamed:@"sellInvButton"];
    UIImage *gemSellImage = [UIImage imageNamed:@"sellGemInvButton"];
    UIImage *backButton = [UIImage imageNamed:@"backInvButton"];
    
    UIImageView *topBar = [[UIImageView alloc] initWithImage:topBarImage];
    UIImageView *back = [[UIImageView alloc] initWithImage:backgroundImage];
    UIImageView *sweet = [[UIImageView alloc] initWithImage:sweetTextureImage];
    UIImageView *sweetNameBg = [[UIImageView alloc] initWithImage:titleBgImage];
    
    topBar.frame = CGRectMake(0, 0, mainItem.frame.size.width, mainItem.frame.size.height/3);
    back.frame = CGRectMake(0, mainItem.frame.size.height/3, mainItem.frame.size.width, mainItem.frame.size.height - mainItem.frame.size.height/3);
    
    float sweetW = mainItem.frame.size.width/3.5;
    float sweetH = mainItem.frame.size.height/3.5;
    float titleW = mainItem.frame.size.width/1.05;
    float titleH = mainItem.frame.size.height/7;
    
    sweet.frame = CGRectMake(mainItem.frame.size.width/2 - sweetW/2, mainItem.frame.size.height/8 - sweetH/2, sweetW, sweetH);
    sweetNameBg.frame = CGRectMake(mainItem.frame.size.width/2 - titleW/2, topBar.frame.size.height + titleH/6, titleW, titleH);
    
    UILabel *sweetName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 + sweetNameBg.frame.size.height/30, sweetNameBg.frame.size.width, sweetNameBg.frame.size.height)];
    
    
    float buttonW = mainItem.frame.size.width/1.25;
    float buttonH = mainItem.frame.size.height/7;
    
    UIButton *sellCoinButton = [[UIButton alloc] initWithFrame:CGRectMake(mainItem.frame.size.width/2 - buttonW/2, sweetNameBg.frame.origin.y + buttonH/0.9, buttonW, buttonH)];
    UIButton *sellGemButton = [[UIButton alloc] initWithFrame:CGRectMake(mainItem.frame.size.width/2 - buttonW/2, sellCoinButton.frame.origin.y + buttonH/0.9, buttonW, buttonH)];
    UIButton *backInvButton = [[UIButton alloc] initWithFrame:CGRectMake(mainItem.frame.size.width/2 - buttonW/2, sellGemButton.frame.origin.y + buttonH/0.9, buttonW, buttonH)];
    
    [sellCoinButton setImage:coinSellImage forState:UIControlStateNormal];
    [sellGemButton setImage:gemSellImage forState:UIControlStateNormal];
    [backInvButton setImage:backButton forState:UIControlStateNormal];
   
    SEL onBack = @selector(onBackPress:);
    SEL onCoinSell = @selector(sellForCoins:);
    SEL onGemSell = @selector(sellForGems:);
   
    sellCoinButton.tag = slotNo + 7500;
    sellGemButton.tag = slotNo + 8500;
    
    [sellCoinButton addTarget:self action:onCoinSell forControlEvents:UIControlEventTouchUpInside];
    [sellGemButton addTarget:self action:onGemSell forControlEvents:UIControlEventTouchUpInside];
    [backInvButton addTarget:self action:onBack forControlEvents:UIControlEventTouchUpInside];
    
    [sweetName setFont:[UIFont fontWithName:@"Coder's-Crux" size:30]];
    [sweetName setTextColor:[UIColor blackColor]];
    [sweetName setText:name];
    [sweetName setTextAlignment:NSTextAlignmentCenter];

    UILabel *coinAmount = [[UILabel alloc] initWithFrame:CGRectMake(sellCoinButton.frame.size.width/2  - sellGemButton.frame.size.width/16, 0, sellCoinButton.frame.size.width/2, sellCoinButton.frame.size.height)];
    UILabel *gemAmount = [[UILabel alloc] initWithFrame:CGRectMake(sellGemButton.frame.size.width/2 - sellGemButton.frame.size.width/16, 0, sellGemButton.frame.size.width/2, sellGemButton.frame.size.height)];

    [coinAmount setFont:[UIFont fontWithName:@"Coder's-Crux" size:30]];
    [coinAmount setTextColor:[UIColor blackColor]];
    [coinAmount setText:[NSString stringWithFormat:@"%d", [self getCoinSelllingPrice:color]]];
    [coinAmount setTextAlignment:NSTextAlignmentCenter];
    
    [gemAmount setFont:[UIFont fontWithName:@"Coder's-Crux" size:30]];
    [gemAmount setTextColor:[UIColor blackColor]];
    [gemAmount setText:[NSString stringWithFormat:@"%d", [self getGemSelllingPrice:color]]];
    [gemAmount setTextAlignment:NSTextAlignmentCenter];
    
    [sweetNameBg addSubview:sweetName];
    [sellCoinButton addSubview:coinAmount];
    [sellGemButton addSubview:gemAmount];
    
    [mainItem addSubview:topBar];
    [mainItem addSubview:back];
    
    if([[sweetInventoryData getInventory] count] > 1){
        [mainItem addSubview:sellCoinButton];
        [mainItem addSubview:sellGemButton];
    }
    
    [mainItem addSubview:backInvButton];
    [mainItem addSubview:sweet];
    [mainItem addSubview:sweetNameBg];
    
    [self addTrendValue:mainItem texture:textureName];
    [self addBrandValue:mainItem texture:textureName];
    
    [v addSubview:mainItem];
    
    [UIView animateWithDuration:0.2 animations:^{
        [mainItem setFrame:CGRectMake(0, v.frame.size.height/4.5, v.frame.size.width, v.frame.size.height - v.frame.size.height/4.5 - v.frame.size.height/6)];
        [mainItem setAlpha:1];
    }];
}
+(NSString*)titleColorDecider: (NSString*)color {
    if([color isEqualToString:@"Grey"]){
        return @"gretTitle";
    }else if([color isEqualToString:@"Blue"]){
        return @"blueTitle";
    }else if([color isEqualToString:@"Red"]){
        return @"redTitle";
    }else if([color isEqualToString:@"Yellow"]){
        return @"yellowTitle";
    }
    
    return @"becuase it didn't select a texture!";
}
+(void)onBackPress: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *v = [sweet superview];
    
    [UIView animateWithDuration:0.2 animations:^{
        [v setFrame:CGRectMake(v.frame.size.width, v.frame.origin.y, v.frame.size.width, v.frame.size.height - v.frame.size.height/4.5 - v.frame.size.height/6)];
        [v setAlpha:0.0];
    } completion:^(BOOL finished){
        [v removeFromSuperview];

    }];
    
}
+(void)sellForCoins: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *v = [sweet superview];
    int slotID = (int)(sweet.tag - 7500);
    [confirmSale confirmPacketPurchase:v tagNumber:slotID];
}
+(void)sellForGems: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *v = [sweet superview];
    int slotID = (int)(sweet.tag - 8500);
    [confirmGemSale confirmGemSale:v tagNumber:slotID];
}
+(int)getCoinSelllingPrice: (NSString*)slotColor {
    if([slotColor isEqualToString:@"Grey"]){
        return 5000;
    }else if([slotColor isEqualToString:@"Blue"]){
        return 20000;
    }else if([slotColor isEqualToString:@"Red"]){
        return 30000;
    }else if([slotColor isEqualToString:@"Yellow"]){
        return 250000;
    }
    
    return 0;
}
+(int)getGemSelllingPrice: (NSString*)slotColor {
    if([slotColor isEqualToString:@"Grey"]){
        return 5;
    }else if([slotColor isEqualToString:@"Blue"]){
        return 15;
    }else if([slotColor isEqualToString:@"Red"]){
        return 25;
    }else if([slotColor isEqualToString:@"Yellow"]){
        return 250;
    }
    
    return 0;
}
+(void)addTrendValue: (UIView*)v texture:(NSString*)name {
    
    NSString *trendValueImageName;
    
    if([name containsString:@"wrapped"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:4]];
    }
    if([name containsString:@"lolly"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:0]];
    }
    if([name containsString:@"jawbreaker"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:1]];
    }
    if([name containsString:@"bonbon"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:3]];
    }
    if([name containsString:@"chew"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:2]];
    }
    if([name containsString:@"candybar"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:5]];
    }
    if([name containsString:@"marshmallow"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:6]];
    }
    if([name containsString:@"pencil"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:7]];
    }
    if([name containsString:@"egg"]){
        trendValueImageName = [NSString stringWithFormat:@"trendsInv%d", [trendsData getTrendMultiplierByPacketTrendID:8]];
    }
    
    UIImage *trendImage = [UIImage imageNamed:trendValueImageName];
    UIImageView *trendValue = [[UIImageView alloc] initWithImage:trendImage];
    
    trendValue.frame = CGRectMake(v.frame.size.width/65, v.frame.size.height/140, v.frame.size.width/3.6, v.frame.size.height/5.5);
    
    [v addSubview:trendValue];
}
+(void)addBrandValue: (UIView*)v texture:(NSString*)name {
    
    NSString *trendValueImageName;
    
    if([name containsString:@"wrapped"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [wrappedPacket getBrandValue]];
    }
    if([name containsString:@"lolly"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [lollyPacket getBrandValue]];
    }
    if([name containsString:@"jawbreaker"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [jawbreakerPacket getBrandValue]];
    }
    if([name containsString:@"bonbon"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [bonbonPacket getBrandValue]];
    }
    if([name containsString:@"chew"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [chewPacket getBrandValue]];
    }
    if([name containsString:@"candybar"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [candybarPacket getBrandValue]];
    }
    if([name containsString:@"marshmallow"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [marshmallowPacket getBrandValue]];
    }
    if([name containsString:@"pencil"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [pencilPacket getBrandValue]];
    }
    if([name containsString:@"egg"]){
        trendValueImageName = [NSString stringWithFormat:@"brandlvl%d", [eggPacket getBrandValue]];
    }
    
    UIImage *trendImage = [UIImage imageNamed:trendValueImageName];
    UIImageView *trendValue = [[UIImageView alloc] initWithImage:trendImage];
    
    trendValue.frame = CGRectMake(v.frame.size.width - v.frame.size.width/65 - v.frame.size.width/4, v.frame.size.height/20, v.frame.size.width/4, v.frame.size.height/10);
    
    [v addSubview:trendValue];
}
@end
