//
//  slotManager.m
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "slotManager.h"
#import "box1.h"

int unlockedSlots = 1;

@implementation slotManager
+(void)addSlots: (SKSpriteNode*)s {
    [box1 addbox:s];
}
+(int)getUnlockedSlots; {
    return unlockedSlots;
}
+(void)setUnlockedSlots:(int)num; {
    unlockedSlots = num;
}
@end
