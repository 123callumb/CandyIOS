//
//  objectivesGold.m
//  Candy
//
//  Created by Callum Beckwith on 15/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectivesGold.h"
#import "objectiveComplete.h"
#import "sweetInventoryData.h"
#import "objectivesData.h"

@implementation objectivesGold
+(void)object0:(UIView*)v {
    int objNo = [objectivesData getGoldProgress];
    
    if(objNo == 0){
        //Called in main load method
        if ([[sweetInventoryData getInventory] count] >= 4) {
            [objectiveComplete createCompletionAnimation:v type0To2:0];
        }
    }
}
+(void)object1:(UIView*)v{
    int objNo = [objectivesData getGoldProgress];
    
    if(objNo == 1){
        //Called in main load method
        if ([[sweetInventoryData getInventory] count] >= 10) {
            [objectiveComplete createCompletionAnimation:v type0To2:0];
        }
    }
}
+(void)object2:(UIView*)v {
    int objNo = [objectivesData getGoldProgress];

    if(objNo == 2){
        //Called on the click on the upgrade machine button!
        [objectiveComplete createCompletionAnimation:v type0To2:0];
    }
}
+(void)object3:(UIView*)v {
    int objNo = [objectivesData getGoldProgress];

    if(objNo == 3){
        //Called on the upgrade building button
        [objectiveComplete createCompletionAnimation:v type0To2:0];
    }
}
+(void)object4:(UIView*)v {
    int objNo = [objectivesData getGoldProgress];

    if(objNo == 4){
        //Called when the upgrade slot button is pressed
        [objectiveComplete createCompletionAnimation:v type0To2:0];
    }
}
@end
