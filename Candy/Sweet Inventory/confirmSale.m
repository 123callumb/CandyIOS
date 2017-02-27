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
#import "objectivesSilver.h"
#import "messageUI.h"

@implementation confirmSale
+(void)confirmPacketPurchase: (UIView*)v tagNumber:(int)tagNo {
    
    [messageUI createConfirmMessageBox:[v superview] information:@"Are you sure you would like to sell this sweet for coins?" representingImage:@"coin" imageScale:0.4 messageBoxID:60 displayOnce:false onConfirm:0 confTag:(6500 + tagNo)];
    
}


@end
