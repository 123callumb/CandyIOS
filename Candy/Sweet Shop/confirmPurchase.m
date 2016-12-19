//
//  confirmPurchase.m
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "confirmPurchase.h"
#import "packetInventoryData.h"
#import "gems.h"

@implementation confirmPurchase

+(void)confirmPacketPurchase: (UIView*)v tagNumber:(int)tagNo {
    
    float scale = 0.24;
    
    UIImage *confirmBG = [UIImage imageNamed:@"confirmationBG"];
    UIImage *buyImageButton = [UIImage imageNamed:@"confrimBuyButton"];
    UIImage *nvmImageButton = [UIImage imageNamed:@"confirmNvmButton"];
    
    UIImageView *confirmView = [[UIImageView alloc] initWithImage:confirmBG];
    confirmView.frame = CGRectMake((v.frame.size.width/2 - (confirmBG.size.width * scale)/2),
                                   (v.frame.size.height/1.75) -  ((confirmBG.size.height * scale)/2),
                                   confirmBG.size.width * scale,
                                   confirmBG.size.height * scale);
    
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *nvmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    float buyButtonH = buyImageButton.size.height * scale;
    float buyButtonW = buyImageButton.size.width * scale;
    float nvmButtonH = nvmImageButton.size.height * scale;
    float nvmButtonW = nvmImageButton.size.width * scale;
    
    SEL onBuyPress = @selector(onBuy:);
    SEL onNvmPress = @selector(onNvm:);
    
    [buyButton setImage:buyImageButton forState:UIControlStateNormal];
    [nvmButton setImage:nvmImageButton forState:UIControlStateNormal];
    
    [buyButton addTarget:self action:onBuyPress forControlEvents:UIControlEventTouchUpInside];
    [nvmButton addTarget:self action:onNvmPress forControlEvents:UIControlEventTouchUpInside];
    
    buyButton.frame = CGRectMake(confirmView.frame.size.width/2 - (buyButtonW/2), confirmView.frame.size.height/2.4, buyButtonW, buyButtonH);
    nvmButton.frame = CGRectMake((confirmView.frame.size.width/2 - (nvmButtonW/2)), confirmView.frame.size.height/1.55, nvmButtonW, nvmButtonH);
    
    buyButton.tag = 3000 + tagNo;
    
    [confirmView setUserInteractionEnabled:true];
    [buyButton setUserInteractionEnabled:true];
    [nvmButton setUserInteractionEnabled:true];
    
    [confirmView addSubview:buyButton];
    [confirmView addSubview:nvmButton];
    
    [v addSubview:confirmView];
    [v bringSubviewToFront:confirmView];
    
}
+(void)onBuy: (id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    
    int packetPressed = (int)(but.tag - 3000);
    
    if (packetPressed == 1) {
        [packetInventoryData addPacketWithStringToInventory:@"lollyPacket"];
    }
    if (packetPressed == 2) {
        [packetInventoryData addPacketWithStringToInventory:@"bonbonPacket"];
    }
    if (packetPressed == 3) {
        [packetInventoryData addPacketWithStringToInventory:@"sweetPacket"];
    }
    if (packetPressed == 4) {
        [packetInventoryData addPacketWithStringToInventory:@"chewPacket"];
    }
    if (packetPressed == 5) {
        [packetInventoryData addPacketWithStringToInventory:@"jawbreakerPacket"];
    }
    
    [gems removeGems:2];
    [v removeFromSuperview];
}
+(void)onNvm: (id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    [v removeFromSuperview];
}

@end
