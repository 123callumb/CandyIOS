//
//  confirmGemSale.m
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "confirmGemSale.h"
#import "sweetInventoryData.h"
#import "itemUI.h"
#import "gems.h"
#import "sweetInventoryUI.h"
#import "objectivesSilver.h"
#import "messageUI.h"

@implementation confirmGemSale

+(void)confirmGemSale: (UIView*)v tagNumber:(int)tagNo {
    
    [messageUI createConfirmMessageBox:[v superview] information:@"Are you sure you would like to sell this sweet for mini gems?" representingImage:@"miniGems" imageScale:0.4 messageBoxID:70 displayOnce:false onConfirm:1 confTag:(13500 + tagNo)];
    
    
}

@end
