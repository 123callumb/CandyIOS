//
//  sweetnessSlider.m
//  Candy
//
//  Created by Callum Beckwith on 23/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetnessSlider.h"
#import "registerBoxes.h"
#import "slot1Data.h"

@implementation sweetnessSlider
int sweetness = 0;

+(void)addSlider: (SKSpriteNode*)s {
    SKSpriteNode *sliderButton = [SKSpriteNode spriteNodeWithImageNamed:@"sliderButtonLonger"];
    sliderButton.name = @"sweetnessSlider";
    sliderButton.position = CGPointMake([self sweetnessValueToSlider:[slot1Data getSweetness:[registerBoxes getSlotPressed]]], -s.frame.size.height/1.23);
    
    [s addChild:sliderButton];
}
+(void)moveSlider:(SKSpriteNode*)s location:(CGPoint)point {
    
    if([s.name isEqualToString:@"sweetnessSlider"]){
        s.position = CGPointMake(point.x, s.position.y);
        [self sweetnessDecider:s.position.x];

    }
}
+(void)sweetnessDecider: (int)x {
    if(x <= -360){
        [slot1Data setSweetness:0 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= -250 && x > -360){
        [slot1Data setSweetness:1 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= -150 && x > -250){
        [slot1Data setSweetness:2 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= -50 && x > -150){
        [slot1Data setSweetness:3 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= 50 && x > -50){
        [slot1Data setSweetness:4 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= 150 && x > 50){
        [slot1Data setSweetness:5 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= 250 && x > 150){
        [slot1Data setSweetness:6 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x <= 350 && x > 250){
        [slot1Data setSweetness:7 sweetNum:[registerBoxes getSlotPressed]];
    }
    if(x > 350){
        [slot1Data setSweetness:8 sweetNum:[registerBoxes getSlotPressed]];
    }else {
    
    }
}
+(int)sweetnessValueToSlider: (int)x {
    if(x == 0){
        return -360;
    }
    if(x == 1){
        return -300;
    }
    if(x == 2){
        return -200;
    }
    if(x == 3){
        return -100;
    }
    if(x == 4){
        return 0;
    }
    if(x == 5){
        return 100;
    }
    if(x == 6){
        return 200;
    }
    if(x == 7){
        return 300;
    }
    if(x == 8){
        return 360;
    } else {
        return 0;
    }
}
@end
