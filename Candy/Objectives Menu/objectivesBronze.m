//
//  objectivesBronze.m
//  Candy
//
//  Created by Callum Beckwith on 16/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectivesBronze.h"
#import "objectivesData.h"
#import "money.h"
#import "objectiveComplete.h"

@implementation objectivesBronze
+(void)object0:(UIView*)v {
    int objNo = [objectivesData getBronzeProgress];
    
    if(objNo == 0){
        //Called when the sweet trend button is called
        [objectiveComplete createCompletionAnimation:v type0To2:2];
    }
}
+(void)object1:(UIView*)v{
    int objNo = [objectivesData getBronzeProgress];
    
    if(objNo == 1){
        //Called when the Player menu button is pressed
        [objectiveComplete createCompletionAnimation:v type0To2:2];
        
    }
}
+(void)object2:(UIView*)v {
    int objNo = [objectivesData getBronzeProgress];
    
    if(objNo == 2){
        //Called when you click a buy button in desk store
        [objectiveComplete createCompletionAnimation:v type0To2:2];
    }
}
+(void)object3:(UIView*)v {
    int objNo = [objectivesData getBronzeProgress];
    
    if(objNo == 3 && [money getBalance] >= 10000){
        //Called in tap method
        [objectiveComplete createCompletionAnimation:v type0To2:2];
    }
}
+(void)object4:(UIView*)v {
    int objNo = [objectivesData getBronzeProgress];
    
    if(objNo == 4){
        //Called when you click a buy button in workstation store
        [objectiveComplete createCompletionAnimation:v type0To2:2];
    }
}
@end
