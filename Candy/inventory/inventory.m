//
//  inventory.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventory.h"
#import "slot1Data.h"

@implementation inventory

+(int)calculateValue {
    return 1;
}
+(int)slotCalculation: (int)slotNumber {
    int sweetType = [slot1Data getSweet:slotNumber];
    int slotValue = 1;
    
    if(sweetType == 0){
        
    }
    if(sweetType == 1){
    
    }
    if(sweetType == 2){
    
    }

    return slotValue;
}

@end
