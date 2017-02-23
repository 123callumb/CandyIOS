//
//  objectivesSilver.m
//  Candy
//
//  Created by Callum Beckwith on 16/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectivesSilver.h"
#import "objectivesData.h"
#import "money.h"
#import "objectiveComplete.h"

@implementation objectivesSilver
+(void)object0:(UIView*)v {
    int objNo = [objectivesData getSilverProgress];
    
    if(objNo == 0){
        //Called when the sweet is equipped to a machine
        [objectiveComplete createCompletionAnimation:v type0To2:1];
    }
}
+(void)object1:(UIView*)v{
    int objNo = [objectivesData getSilverProgress];
    
    if(objNo == 1){
        //Called when the Gemerator button is pressed
        [objectiveComplete createCompletionAnimation:v type0To2:1];
        
    }
}
+(void)object2:(UIView*)v {
    int objNo = [objectivesData getSilverProgress];
    
    if(objNo == 2){
        //Called in the on touch function
        if([money getBalance] >= 10000){
            [objectiveComplete createCompletionAnimation:v type0To2:1];
        }
    }
}
+(void)object3:(UIView*)v {
    int objNo = [objectivesData getSilverProgress];
    
    if(objNo == 3){
        //Called when the advert claim is pressed
        [objectiveComplete createCompletionAnimation:v type0To2:1];
    }
}
+(void)object4:(UIView*)v {
    int objNo = [objectivesData getSilverProgress];
    
    if(objNo == 4){
        //Called on the sell of a sweet
        [objectiveComplete createCompletionAnimation:v type0To2:1];
    }
}
+(void)object5:(UIView*)v {
    int objNo = [objectivesData getSilverProgress];
    
    if(objNo == 5){
        //Called on sale of sweet gem
        [objectiveComplete createCompletionAnimation:v type0To2:1];
    }
}
@end
