//
//  buttonHandler.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "buttonHandler.h"
#import "inventoryButton.h"
#import "sweetsButton.h"
#import "coinButton.h"

@implementation buttonHandler
+(void)registerButtons:(SKNode *)obj {
    
    if([obj.name isEqualToString:@"buttonInventory"]){
        [inventoryButton onTouch:obj];
    }
    
    if([obj.name isEqualToString:@"buttonSweets"]){
        [sweetsButton touched:obj];
    }
    
    if([obj.name isEqualToString:@"buttonMoney"]){
        [coinButton touched:obj];
    }
}
@end
