//
//  confirmSale.m
//  Candy
//
//  Created by Callum Beckwith on 26/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "confirmSale.h"
#import "itemUI.h"
#import "sweetInventoryData.h"
#import "money.h"
#import "sweetInventoryUI.h"

@implementation confirmSale
+(void)confirmPacketPurchase: (UIView*)v tagNumber:(int)tagNo {
    
    float scale = 0.24;
    
    UIImage *confirmBG = [UIImage imageNamed:@"confirmBox"];
    UIImage *sellImageButton = [UIImage imageNamed:@"confirmButton"];
    UIImage *nvmImageButton = [UIImage imageNamed:@"cancelButton"];
    
    UIImageView *confirmView = [[UIImageView alloc] initWithImage:confirmBG];
    confirmView.frame = CGRectMake((v.frame.size.width/2 - (confirmBG.size.width * scale)/2),
                                   -((confirmBG.size.height * scale)/2),
                                   confirmBG.size.width * scale,
                                   confirmBG.size.height * scale);
    
    UIButton *sellButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *nvmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    float buyButtonH = sellImageButton.size.height * scale;
    float buyButtonW = sellImageButton.size.width * scale;
    float nvmButtonH = nvmImageButton.size.height * scale;
    float nvmButtonW = nvmImageButton.size.width * scale;
    
    SEL onSellPress = @selector(onSell:);
    SEL onNvmPress = @selector(onNvm:);
    
    [sellButton setImage:sellImageButton forState:UIControlStateNormal];
    [nvmButton setImage:nvmImageButton forState:UIControlStateNormal];
    
    [sellButton addTarget:self action:onSellPress forControlEvents:UIControlEventTouchUpInside];
    [nvmButton addTarget:self action:onNvmPress forControlEvents:UIControlEventTouchUpInside];
    
    sellButton.frame = CGRectMake(confirmView.frame.size.width/2 - (buyButtonW/2), confirmView.frame.size.height/4, buyButtonW, buyButtonH);
    nvmButton.frame = CGRectMake((confirmView.frame.size.width/2 - (nvmButtonW/2)), confirmView.frame.size.height/2, nvmButtonW, nvmButtonH);
    
    sellButton.tag = 6500 + tagNo;
    
    [confirmView setUserInteractionEnabled:true];
    [sellButton setUserInteractionEnabled:true];
    [nvmButton setUserInteractionEnabled:true];
    
    [confirmView addSubview:sellButton];
    [confirmView addSubview:nvmButton];
    
    [v addSubview:confirmView];
    [v bringSubviewToFront:confirmView];
    
    [UIView animateWithDuration:0.2 animations:^{
        [confirmView setFrame:CGRectMake((v.frame.size.width/2 - (confirmBG.size.width * scale)/2),
                                         (v.frame.size.height/1.5) -  ((confirmBG.size.height * scale)/2),
                                         confirmBG.size.width * scale,
                                         confirmBG.size.height * scale)];
    }];
    
}
+(void)onSell: (id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    UIView *v2 = [v1 superview];
    
    int slotNo = (int)(but.tag - 6500);
    
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    NSString *color = [slotData objectForKey:@"sweet_color"];
    
    int amount = [itemUI getCoinSelllingPrice:color];
    
    [sweetInventoryData removeObject:slotNo];
    [money addBalance:amount];
    [sweetInventoryUI refreshView:v2];
    
    [v1 removeFromSuperview];
}
+(void)onNvm: (id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    [v removeFromSuperview];
}

@end
