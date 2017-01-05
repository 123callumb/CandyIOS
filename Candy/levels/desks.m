//
//  desks.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "desks.h"
#import "candyMachines.h"

@implementation desks
+(void)addDeskTypes: (NSMutableArray*)desks {
    [desks addObject:@"desk_wood"]; //ID 0 for when pulling from else where etc...
    [desks addObject:@"desk_betterwood;)"];  //ID 1
}
+(NSArray*)getDeskTypes {
    NSMutableArray *deskTypes = [[NSMutableArray alloc] init];
    [self addDeskTypes:deskTypes];
    return deskTypes;
}
+(NSString*)getCurrentDesk {
    int deskID = [self getCurrentDeskID];
    return [[self getDeskTypes] objectAtIndex:deskID];
}
+(void)setCurrentDeskID: (int)deskID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:deskID forKey:@"desk_ID"];
    [nd synchronize];
}
+(int)getCurrentDeskID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"desk_ID"];
}
+(void)addDesk: (CGPoint)pos scale:(float)scale nodeToAttatch:(SKScene*)s {
    SKSpriteNode *desk = [SKSpriteNode spriteNodeWithImageNamed:[self getCurrentDesk]];
    desk.xScale = scale;
    desk.yScale = scale;
    desk.position = pos;
    desk.zPosition = 0;
    desk.name = @"desk";
    [candyMachines addCandyMachine:desk scale:1 position:CGPointMake(-desk.frame.size.width/2.4, desk.frame.size.height/1.3)];
    [s addChild:desk];
}
@end
