//
//  registerBoxes.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "registerBoxes.h"
#import "box1DataScreen.h"

@implementation registerBoxes
+(void)registerBoxes:(SKNode *)obj currentScene:(SKScene *)s {
    
    if([obj.name isEqualToString:@"box_1_1"] ||
       [obj.name isEqualToString:@"box_1_2"] ||
       [obj.name isEqualToString:@"box_1_3"] ||
       [obj.name isEqualToString:@"box_1_4"]){
        [box1DataScreen menuActions:s inScene:true];
        SKAction *animate = [SKAction scaleBy:0.8 duration:0.2];
        SKAction *inAnimate = [SKAction scaleBy:1.25 duration:0.2];
        [obj runAction:animate completion:^{[obj runAction:inAnimate];}];
    }
}
@end
