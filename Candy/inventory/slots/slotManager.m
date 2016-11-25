//
//  slotManager.m
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "slotManager.h"
#import "box1.h"


@implementation slotManager
+(void)addSlots: (SKSpriteNode*)s {
    [box1 addbox:s];
}
@end
