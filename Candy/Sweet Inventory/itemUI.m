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

@implementation itemUI

+(void)createNewItemUi: (UIView*)v slotId:(int)slotNo {
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    NSString *textureName = [slotData objectForKey:@"sweet_texture"];
    NSString *name = [slotData objectForKey:@"sweet_name"];
    NSString *color = [slotData objectForKey:@"sweet_color"];
    
    UIView *mainItem = [[UIView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/4.5, v.frame.size.width, v.frame.size.height - v.frame.size.height/4.5 - v.frame.size.height/6)];
    
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
    [mainItem addSubview:sellCoinButton];
    [mainItem addSubview:sellGemButton];
    [mainItem addSubview:backInvButton];
    [mainItem addSubview:sweet];
    [mainItem addSubview:sweetNameBg];
    
    [v addSubview:mainItem];
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
    
    [v removeFromSuperview];
}
+(void)sellForCoins: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *v = [sweet superview];
    int slotID = (int)(sweet.tag - 7500);
    [confirmSale confirmPacketPurchase:v tagNumber:slotID];
}
+(void)sellForGems: (id)sender {
    
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
@end
